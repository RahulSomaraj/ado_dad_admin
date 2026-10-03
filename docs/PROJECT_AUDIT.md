# ado_dad_admin — Project Audit & Redesign Baseline

_Generated baseline before UI redesign. Branch: `develop`. Date: 2026-06-12._

## 1. What this project is

A **Flutter Web** admin panel for the "Ado-dad" vehicle classifieds / marketplace. It manages users, showrooms, the vehicle catalog (manufacturer → model → variant), advertisements, banners, and reports, with role-based access.

**Stack**
- State management: `flutter_bloc` / `bloc`
- Networking: `dio` (singleton `ApiService` with auth + refresh-token interceptor)
- Routing: `go_router` (declarative, with auth redirect)
- Models: `freezed` + `json_serializable` (codegen — `.freezed.dart` / `.g.dart`)
- Local storage: `flutter_secure_storage` + `shared_preferences`
- Config: `flutter_dotenv` (`.env`)
- Other: `fl_chart`, `pdf` + `printing`, `file_picker`, `image_picker`, `carousel_slider`, `google_fonts`, `intl`, `drift`

## 2. Branch & environment status

- **Current branch:** `develop` (active; 139 lib files vs 114 on `main`).
- **No `uat` branch exists** — local or remote. Branches present: `develop`, `main`, `feature/login_auth`.
- **Env variables used in code:** exactly **one** — `API_BASE_URL`, read in `lib/repositories/api_service.dart` via `dotenv.env['API_BASE_URL'] ?? ''`.
- **`.env` present:** yes, value `http://localhost:3000`.
- **Risks:**
  - `.env` is **gitignored** (`.env*`) and **not tracked**; there is **no `.env.example`**. A fresh clone has no `.env` → empty base URL, silent failure.
  - Current value targets `localhost` — not valid for UAT/prod. The CI workflow (`.github/workflows/develop.yaml`) builds web on the EC2 host, so UAT uses whatever `.env` lives on that server, not this file.
  - **Action pending:** awaiting the real UAT API base URL from you to wire up.

## 3. Roles

User type is stored locally (`getUserType()`) and drives both the dashboard and the drawer menu.

| Code | Role | Default dashboard |
|------|------|-------------------|
| `SA` | Super Admin | `AdminDashboard` (full menu incl. Advertisements) |
| `AD` | Admin | `AdminAdsDashboard` (no Advertisements menu item) |
| `SR` | Showroom | `ShowroomDashboard` |

## 4. Routes map

Login is the entry (`/`). All authenticated screens live inside a `ShellRoute` → `AdminLayout` (sidebar + content). Auth redirect: unauthenticated users are forced to `/`; authenticated users hitting `/` go to `/dashboard`.

| Route | Page | Notes |
|-------|------|-------|
| `/` | `LoginPage` | Entry / auth |
| `/dashboard` | `RoleBasedDashboard` | Branches by role (SA/AD/SR) |
| `/profile` | `MyProfile` | |
| `/users` | `Users` (list) | + `/add-user`, `/edit-user`, `/view-user` |
| `/advertisements` | `AdminAdsDashboard` | SA only in drawer |
| `/create-ad` | _placeholder_ | "Listing Management" stub |
| `/vehicle-manufactures` | `VehicleManufacturesList` | + add / edit / view |
| `/vehicle-models` | `VehicleModelsList` | + add / edit / view |
| `/add-vehiclevariant`, `/edit-vehiclevariant` | variant add/edit | nested under model |
| `/showrooms` | `Showroom` (list) | + add / edit / view |
| `/reports` | `ReportList` | |
| `/banners` | `BannerPage` | + `/upload-banners`, `/edit-banner` |
| `/notifications` | _placeholder_ | "Noti Management" stub |

**Placeholder/stub routes** (good redesign candidates): `/create-ad` and `/notifications` are inline `Center(Text(...))` stubs, not real pages.

## 5. Feature modules (lib/features)

Each module follows the same shape: `bloc/` (event/state/bloc, some freezed) + `ui/`.

- `login` — auth
- `admin_layout` — app shell (responsive sidebar / drawer)
- `dashboard` — role-based, admin ads, showroom, user dashboards
- `users` — list/add/edit/view + user-ads
- `showroom` — list/add/edit/detail + showroom-ads
- `vehicle_manufacturer`, `vehicle_model`, `vehicle_variant`, `vehicle_company` — catalog (note: `vehicle_company` bloc is **commented out** in `main.dart`)
- `banner` — list/upload/edit
- `reports` — list (PDF/CSV export via `common/`)
- `profile`, `vehicle` (edit), `widgets` (shared inputs/search)

Repositories in `lib/repositories/` mirror these modules and all go through the shared `ApiService`.

## 6. Navigation shell (for nav/layout rework)

`AdminLayout` (`lib/features/admin_layout/admin_layout.dart`):
- **Responsive breakpoint at 900px.** ≥900px → fixed 250px sidebar (`AdminDrawer`). <900px → `AppBar` + hamburger drawer.
- Contains a large block of **commented-out legacy code** (old StatefulWidget + profile bar). The profile bar (`_buildProfileBar`) is defined but **not used** — currently dead code.
- `AdminDrawer` (`lib/common/widgets/drawer.dart`) hard-codes the menu and selected-index logic per role via big `switch` statements on the route string — brittle; worth refactoring during the nav redesign.

## 7. Theme / color baseline (for restyle)

`lib/common/app_theme.dart` is **effectively empty** — `ThemeData(useMaterial3: true)` with everything else commented out. There is **no centralized typography, no color scheme, no component theming**. Styling is done ad-hoc per screen. This is the single biggest restyle opportunity: a real `ThemeData` (colorScheme, textTheme, input/button/card themes) would propagate consistently.

`lib/common/app_colors.dart` current palette:

| Name | Value |
|------|-------|
| `primaryColor` | `#FFFFFF` (white) |
| `primaryColor1` | `#4F48EC` (indigo) |
| `logoColor` | `#FABA00` (amber/yellow) |
| `scaffoldColor` | `#FFFAEB` (cream) |
| `blackColor` | `#000000` |
| `greyColor` | `#959CA9` |
| `greyColor2` | `Colors.black26` |
| `redColor` | `#F05555` |

Note `primaryColor` being white while `primaryColor1` is the actual accent is a naming smell to clean up in the restyle.

## 8. Build & run verification checklist

I cannot run Flutter in my sandbox — run these on your machine (repo root). The `build_runner` step is required because of freezed/json codegen.

```bash
# 1. Confirm toolchain
flutter --version
flutter doctor

# 2. Ensure .env exists (currently API_BASE_URL=http://localhost:3000)
cat .env

# 3. Dependencies
flutter pub get

# 4. Regenerate freezed/json code (.freezed.dart / .g.dart)
dart run build_runner build --delete-conflicting-outputs

# 5. Static analysis — should come back clean
flutter analyze

# 6. Run on web
flutter run -d chrome

# 7. (Optional) production web build, mirrors CI
flutter build web --release
```

**Checklist**
- [ ] `flutter doctor` shows web enabled
- [ ] `.env` present with a valid `API_BASE_URL`
- [ ] `pub get` succeeds
- [ ] `build_runner` completes with no conflicts
- [ ] `flutter analyze` → 0 errors
- [ ] App launches in Chrome and login screen renders
- [ ] Backend reachable at `API_BASE_URL`

## 9. Recommended redesign sequence

1. **Env hygiene** — add `.env.example`, wire the real UAT URL.
2. **Theme foundation** — build a proper `ThemeData` (colorScheme + textTheme + component themes) so the restyle is centralized, not per-screen.
3. **Navigation/layout** — clean up `AdminLayout` dead code; refactor `AdminDrawer`'s route→index switches into a data-driven menu config.
4. **Restyle existing screens** on top of the new theme.
5. **New pages** — flesh out the `/create-ad` and `/notifications` stubs, plus whatever new screens you specify.
