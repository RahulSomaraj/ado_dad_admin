# Reports Management — User Strike & Suspension Module

_Design document. Status: awaiting approval. No code until the checklist is confirmed._

## 0. Stack reality check (conflicts with the original brief)

| Brief said | Actual repo |
|---|---|
| PostgreSQL backend | **MongoDB + Mongoose** (28 `@Schema` classes, 0 TypeORM entities; `pg`/`typeorm` present but unused) |
| Database migrations | Mongoose is schemaless — **no migrations**; additive schema changes + `ts-node` seed scripts |
| React admin dashboard | **Flutter** (Bloc + `dio` + `go_router`) |
| Super Admin vs Moderator roles | Roles = `UserType` SA / AD / NU / SR; `user-role.enum.ts` is empty; **no Moderator role yet** |
| Thresholds "configurable via admin settings" | No settings collection today (env-based `ConfigModule` only) — would be **new** |

**A report system already exists** (`UserReport` schema/service/controller under `src/users/`, plus the Flutter `report_list` screen). This module **extends** it.

## 1. Existing architecture (reuse these patterns)

**Backend (NestJS + Mongoose)**
- `src/<feature>/` → `.module.ts`, `.controller.ts`, `.service.ts`, `dto/`, `schemas/`.
- `@Schema({ timestamps: true })` + `SchemaFactory.createForClass`; refs via `@Prop({ type: Types.ObjectId, ref: 'X' })`; soft-delete via `isDeleted`.
- Thin controllers → services; DTOs use `class-validator`; Swagger via `@ApiTags/@ApiOperation/@ApiBearerAuth`.
- Auth: `@UseGuards(JwtAuthGuard, RolesGuard)` + `@Roles(UserType…)`; guard reads `user.type`.
- Errors: per-controller `@UseFilters(new HttpExceptionFilter('X'))`.
- Pagination response shape: `{ data, total, page, limit, totalPages, hasNext, hasPrev }`.
- Notifications: push `FcmNotificationService.sendToUser(userId, title, body, data)` / `sendBroadcast`; queued log `NotificationProducer.createAndQueue`; email `utils/email.service.ts` (nodemailer/SES).
- Tests: Jest unit (`*.spec.ts`) + e2e (`test/*.e2e-spec.ts`).

**Frontend (Flutter)**
- `lib/features/<feature>/{bloc,ui}`, `lib/repositories/<x>_rep.dart`, `lib/models/`.
- Bloc events/states; repos use `ApiService().dio` (JWT interceptor + refresh); routes in `common/app_routes.dart`.
- Shared UI: `features/widgets/list_page.dart` (`ListPageHeader`, `FillWidthDataTable`, `ListPagination`, `ListRowAction`, `listCardDecoration`); tokens in `common/app_colors.dart` / `app_theme.dart`.

## 2. Data model (Mongoose)

- **User** *(extend)*: `strikeCount`, `moderationStatus` (active|suspended|banned), `suspendedUntil`.
- **Ad** *(extend)*: `isRemovedByAdmin`, `removedBy`, `removedAt`, `removalReason` (separate from user `isDeleted`; reversible).
- **UserReport** *(extend)*: `resolutionAction`, link to action log.
- **UserStrike** *(new)*: `user`, `report?`, `level`, `reason`, `issuedBy`, `notes`, `isActive`, timestamps.
- **Suspension** *(new)*: `user`, `type` (temporary|permanent_ban), `reason`, `startsAt`, `endsAt?`, `issuedBy`, `status` (active|lifted|expired), `liftedBy/liftedAt`, `relatedReport?`.
- **AdminActionLog** *(new, audit)*: `actor`, `actionType`, `targetType/targetId`, `report?`, `metadata` (before/after), `notes`, `createdAt`.
- **ModerationSettings** *(new, singleton)*: configurable strike thresholds + durations.
- **Appeal** *(new)*: `user`, `suspension`, `message`, `status`, `reviewedBy`.

## 3. API surface

- Reports queue (extend `/user-reports`): filters (status, type, date range, reported user, reporter, strike level, suspension status); enriched `GET /:id`; `PATCH /:id/resolve`, `PATCH /:id/dismiss`.
- New `moderation` module: strikes add/remove/history; suspend/unsuspend/ban + history; `GET /moderation/users/:id` profile; suspensions list; audit logs; settings GET/PUT; appeals (submit + review).
- Ad removal: `POST /ads/:id/admin-remove`, `POST /ads/:id/admin-restore`; enforcement guard returns `403` for suspended users on create/edit/republish/boost.

## 4. Screens & wireframe checklist

1. Reports List — filter bar + table + quick actions + pagination (extends existing).
2. Report Detail — report info, advertisement (remove/restore), reported-user profile, strike history, suspension history, admin action panel.
3. User Moderation History — per-user timeline.
4. Suspension Management — suspended/banned users list with lift/unsuspend.
5. Moderation Settings — configurable strike thresholds (Super Admin).
6. Appeals Review — list + decision (approve/reject).

## 5. New vs reused frontend

- **Reuse:** `ListPageHeader`, `FillWidthDataTable`, `ListPagination`, `ListRowAction`, status chips, theme tokens, `ApiService`/dio, Bloc pattern, `app_routes`.
- **New:** `ModerationBloc` + `moderation_rep.dart`; models (Strike, Suspension, AuditLog, ModerationProfile, ModerationSettings, Appeal); widgets (filter bar, AdminActionPanel, StrikeHistory/SuspensionHistory lists, UserModerationProfile card); screens (Report Detail, Moderation History, Suspension Management, Settings, Appeals).

## 6. Open questions / assumptions

1. Confirm target = Mongoose + Flutter (not Postgres/React). No SQL migrations; Jest unit + e2e.
2. Moderator role: add new `MODERATOR` to `UserType`, or treat `AD` = Moderator / `SA` = Super Admin? (Lean: add `MODERATOR`.)
3. Strikes: separate `UserStrike` collection + denormalized counter (recommended).
4. Auto-actions: crossing a strike threshold auto-creates the suspension/ban + fires notifications (admin can override)?
5. Appeals: in scope now or stub later?
6. Settings store: new collection with GET/PUT + UI (vs env-only)?
7. Enforcement: block suspended users at the ads service layer with `403` — confirm behavior/message.

## 7. Implementation checklist (build only ticked items)

Data model: (1) User ext, (2) Ad ext, (3) UserReport ext, (4) UserStrike, (5) Suspension, (6) AdminActionLog, (7) ModerationSettings, (8) Appeal.
Backend: (9) report filters + detail, (10) resolve/dismiss, (11) strikes, (12) suspend/unsuspend/ban, (13) moderation profile, (14) suspensions list, (15) audit logs, (16) settings, (17) appeals, (18) ad remove/restore, (19) enforcement guard, (20) notifications.
Frontend: (21) Reports List filters, (22) Report Detail, (23) action panel, (24) history widgets, (25) Moderation History, (26) Suspension Management, (27) Settings, (28) bloc+repo+models, (29) routes+drawer.
Cross-cutting: (30) RBAC, (31) audit logging, (32) validation+Swagger, (33) unit tests, (34) e2e tests, (35) responsive pass.
