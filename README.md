# cursor-workflow (wfendtoend)

Bộ quy trình A→Z cho **Cursor Agent**: từ ý tưởng → phỏng vấn → SPEC → plan → ticket → code → review → verify → commit.

Repo: [HaManhTuan/wfendtoend](https://github.com/HaManhTuan/wfendtoend)

---

## Bạn cần làm gì? (tóm tắt)

1. **Cài kit** vào folder dự án (một lần / repo).
2. **Mở dự án trong Cursor.**
3. Gõ slash **`/greenfield`** (app mới) hoặc **`/feature`** (tính năng mới).
4. **Trả lời từng câu hỏi** của agent (grill) — đừng bảo “code luôn” nếu chưa approve SPEC.
5. Khi agent hỏi approve SPEC / plan → đọc file trong `artifacts/` rồi ok.
6. Bảo agent **implement** → xem `npm test` / `npm run build` (verify, có bảng acceptance).
7. Bảo **commit** khi hài lòng (`ship`) — đó là git, chưa phải user đang dùng.
8. Khi muốn dev/user nhận bản: **`/release`** (changelog, migrate, rollback, người ký).

Agent **phải** ghi nhật ký tại `artifacts/reviews/<slug>-run-log.md` (slash + skill từng bước).

---

## Ví dụ: ý tưởng “website bán hàng”

Giả sử bạn muốn làm **shop MVP** (catalog + giỏ + checkout giả lập).

### Bước 0 — Tạo folder dự án

```bash
mkdir -p /path/to/my-shop && cd /path/to/my-shop
git init -b main
```

### Bước 1 — Cài workflow vào repo đó

Clone kit (hoặc dùng bản local), rồi:

```bash
# Nếu đã clone wfendtoend:
./scripts/install-to-project.sh /path/to/my-shop

# Xem trước (không ghi file):
./scripts/install-to-project.sh /path/to/my-shop --dry-run

# Chỉ lấy .cursor (repo đã có AGENTS.md riêng):
./scripts/install-to-project.sh /path/to/my-shop --cursor-only
```

Installer **không đè** file của bạn mặc định. Conflict → skip; muốn thay thì `--force` (có backup `.wfendtoend-backup/`).

Sau install, mở **`/path/to/my-shop`** trong Cursor (không mở nhầm folder kit).

### Bước 2 — (Khuyến nghị) skill hỗ trợ tìm thêm & FE

Chạy **một lần trên máy** (user/global), không nhét vào core kit:

```bash
npx skills add https://github.com/vercel-labs/skills --skill find-skills
```

Shop là FE/UI → thêm:

```bash
npx skills add anthropics/skills --skill frontend-design

# Optional — smoke test trong browser sau này
npm i -g agent-browser && agent-browser install
npx skills add https://github.com/vercel-labs/agent-browser --skill agent-browser
```

Muốn agent **reuse trước, viết ít code hơn** khi implement → xem **Ponytail**.  
Muốn **audit bảo mật** (auth, API, inject…) trước khi ship → xem **security-audit**.

### Bước 3 — Bắt đầu trong Cursor (slash)

Trong chat Agent, gõ:

```text
/greenfield
```

Rồi mô tả ngắn, ví dụ:

```text
Làm website bán hàng MVP: catalog sản phẩm, giỏ hàng, trang checkout giả lập.
Chưa cần thanh toán thật / admin CMS.
```

**Agent sẽ:**

| Thứ tự | Việc agent làm | Slash / skill | File bạn mở để xem |
|--------|----------------|---------------|--------------------|
| 1 | Ghi run-log | `run-log` | `artifacts/reviews/shop-mvp-run-log.md` |
| 2 | **Phỏng vấn** (1 câu / lượt) | `discover` / `grilling` | `artifacts/research/shop-mvp.md` |
| 3 | Viết SPEC → bạn approve | `discover` | `artifacts/specs/shop-mvp.md` |
| 4 | Khoá scope | `lock-scope` | `…-scope.md` hoặc section trong SPEC |
| 5 | Plan + rủi ro | `write-plan`, `risk-assess` | `artifacts/plans/…` |
| 6 | Cắt ticket | `to-tickets` | `artifacts/tickets/…` |
| 7 | Bạn nói “làm đi” | `implement` + `tdd` | code trong repo |
| 8 | Review 2 trục | `dual-review` | `artifacts/reviews/…` |
| 9 | Chạy check | `verify` | `artifacts/reviews/…-verify.md` |
| 10 | Bạn nói “commit” | `ship` | git commit |

### Bước 4 — Bạn trả lời grill (bắt buộc)

Agent hỏi từng câu, ví dụ:

- Bán gì? (thời trang / đồ ăn / digital…)
- Ai là khách?
- Checkout giả lập thế nào là đủ?
- Stack? (Next / Laravel + Blade / …)
- Có tài khoản đăng nhập không?

Gõ câu trả lời bình thường.  
Muốn bỏ phỏng vấn (không khuyến nghị): phải gõ rõ:

```text
skip grill: dùng assumptions trong research — MVP chỉ catalog + cart localStorage, không auth
```

Không có câu đó → agent **không được** tự bịa assumption rồi code.

### Bước 5 — Approve rồi mới code

Khi có SPEC/plan/tickets, bạn gõ kiểu:

```text
SPEC ok. Plan ok. Implement T1.
```

Hoặc:

```text
Làm hết các ticket ready frontier.
```

### Bước 6 — Xem / chạy app (tuỳ stack)

Ví dụ frontend:

```bash
npm install
npm run dev
npm run build
```

### Bước 7 — Ship

```text
Commit giúp với message rõ ràng. Đừng push.
```

---

## Cheat sheet — Cursor slash

| Gõ trong Cursor | Khi nào |
|-----------------|---------|
| `/ask` | Không biết bắt đầu đâu |
| `/greenfield` | App / sản phẩm mới |
| `/feature` | Tính năng mới trên repo đã có |
| `/bug` | Bug / regression |
| `/handoff` | Hết context / giao agent khác |
| `/triage` | Dọn inbox issue |
| `/wayfinder` | Epic nhiều session |
| `/architecture` | Rà soát kiến trúc |
| `/prototype` | Thử UI/logic trước khi lock SPEC |
| `/teach` | Học, không ship product |
| `/release` | Đưa bản đã verify cho đúng đối tượng (deploy/publish). Không phải commit |

## Cheat sheet — shell (kit)

```bash
# Cài vào app
./scripts/install-to-project.sh /path/to/app
./scripts/install-to-project.sh /path/to/app --dry-run
./scripts/install-to-project.sh /path/to/app --cursor-only
./scripts/install-to-project.sh /path/to/app --force

# Worktree song song (Orca-lite)
./scripts/new-worktree.sh api-impl
```

## File quan trọng sau khi cài

| Path | Việc của nó |
|------|-------------|
| `AGENTS.md` | Router skill |
| `.cursor/skills/` | Playbook từng phase |
| `.cursor/commands/` | Slash `/feature`… |
| `artifacts/` | SPEC, plan, tickets, **run-log** (commit `*.md`) |
| `GLOSSARY.md` | Ngôn ngữ chung |
| `docs/agents/issue-tracker.md` | Tracker / label |

## Pipeline (nhớ một hình)

```text
/greenfield hoặc /feature
  → discover (grill + Q&A) → lock-scope → write-plan → risk-assess → to-tickets
  → implement (+ tdd) → dual-review → verify → ship → release → retro
```

`ship` = commit/PR. `release` = đối tượng dùng được bản đó. Repo đã cài kit cũ cần cài lại (hoặc `--force`) để lấy skill `/release`.

## Nguyên tắc cứng

1. **Grill trước code** (hoặc `skip grill:` có chữ ký user).  
2. **Slash + run-log** = dấu vết cho người đọc sau.  
3. **Artifacts trên git** (`artifacts/**/*.md`).  
4. **Verify có exit code và bảng acceptance** trước khi nói xong.  
5. **Static FE** có thể verify bằng build/smoke, không ép Jest giả.
6. **Không gọi commit là release.**

## FE design skills (stack — không nằm trong core)

Xem bảng chọn + lệnh cài trong mục “Optional — frontend design” trước đây; tóm tắt:

```bash
npx skills add anthropics/skills --skill frontend-design
npx skills add leonxlnx/taste-skill --skill design-taste-frontend   # optional
npx skills add evondev/evondevKit -a cursor                         # wireframe gate
```

Dùng trên **repo app**, không copy vào core kit này.

## Ponytail (optional — code gọn hơn)

[DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) là **skill/prompt cho agent** (“lazy senior”: reuse trước, viết tối thiểu, vẫn giữ test/security). Nó **không** thay cursor-workflow và **không** phải framework backend.

| Lớp | Vai trò |
|-----|---------|
| **cursor-workflow** | Quy trình: grill → SPEC → plan → ticket → implement → verify → ship → release |
| **Ponytail** | Phong cách code khi agent đang implement/review: ít code thừa, ưu tiên cái đã có trong repo |

### Khi nào dùng chung

- Xây **backend** (API, DB, auth…) hoặc FE bằng `/greenfield` / `/feature` như bình thường.
- Bật Ponytail để lúc `implement` / review agent ít over-engineer.
- **Không** cài workflow vào repo Ponytail để “biến Ponytail thành backend” — sai mục đích.

### Cài Ponytail cho Cursor (trên máy / project app)

Theo [INSTALL.md (Cursor)](https://github.com/DietrichGebert/ponytail/blob/main/INSTALL.md#cursor) — clone một lần, rồi gắn hooks:

```bash
# Clone ngoài repo app (giữ path ổn định)
git clone https://github.com/DietrichGebert/ponytail ~/src/ponytail
cd ~/src/ponytail

# User-level (mọi project Cursor):
node scripts/cursor-hooks.js install

# Hoặc chỉ project đang mở (sau khi đã cài cursor-workflow vào app):
node scripts/cursor-hooks.js install --project /path/to/my-app
```

Cần `node` trên PATH. Mở chat Cursor mới sau khi cài.

Trong chat (tin nhắn thường, không phải slash kit):

```text
/ponytail          # xem level hiện tại
/ponytail lite
/ponytail full
/ponytail ultra
/ponytail off
```

Gỡ hooks: `node scripts/cursor-hooks.js uninstall` (thêm `--project …` nếu đã cài theo project).

Chi tiết / lệnh review-audit trên host khác: [ponytail README](https://github.com/DietrichGebert/ponytail#commands).

### Thứ tự khuyến nghị khi làm backend mới

```text
1. mkdir app && git init
2. ./scripts/install-to-project.sh /path/to/app     # cursor-workflow
3. (optional) node ~/src/ponytail/scripts/cursor-hooks.js install --project /path/to/app
4. Mở /path/to/app trong Cursor → /greenfield → grill → approve SPEC → implement
```

### Cảnh báo xung đột

- **Không** copy `AGENTS.md` của Ponytail đè lên `AGENTS.md` của kit — router workflow sẽ mất.
- Prefer **hooks** (`cursor-hooks.js`) thay vì rule `.cursor/rules/ponytail.mdc` nếu đã dùng hooks (Ponytail: khi có rule thì hooks không inject level).
- Installer kit mặc định **không đè** file; tránh `--force` nếu project đã có hooks/rules Ponytail.
- Subagent Cursor và cloud agent có thể **không** nhận ruleset Ponytail (giới hạn upstream) — pipeline `/feature` vẫn chạy bình thường.

## security-audit (optional — audit bảo mật)

[cloudflare/security-audit-skill](https://github.com/cloudflare/security-audit-skill) biến agent thành **auditor bảo mật** nhiều pha: recon → hunting → validate độc lập → `findings.json` → báo cáo. Đây là skill seed của harness Cloudflare ([blog](https://blog.cloudflare.com/build-your-own-vulnerability-harness)). Nó **không** thay `dual-review` / `verify` của kit — bổ sung khi cần tìm lỗ hổng thật, có bằng chứng.

| Lớp | Vai trò |
|-----|---------|
| **cursor-workflow** | Ship đúng scope: SPEC → ticket → code → verify |
| **Ponytail** | Code gọn, reuse |
| **security-audit** | Săn & xác minh vulnerability (confirmed / needs_validation / rejected) |

### Khi nào dùng trong pipeline

```text
… → implement → dual-review → verify
                 └─ (optional) security audit trước release nếu đụng auth/PII/tiền/upload
                 └─ ship (git) → release (đối tượng nhận bản)
```

- Sau slice có **auth, input user, API, payment, upload, multi-tenant**.
- Trước release / PR nhạy cảm — không cần chạy mỗi typo fix.
- Có thể hỏi hẹp (`./src/api`) hoặc full codebase.

### Cài (user/global hoặc theo agent — không nhét vào core kit)

```bash
npx skills add https://github.com/cloudflare/security-audit-skill \
  --skill security-audit

# Mọi project trên máy:
npx skills add https://github.com/cloudflare/security-audit-skill \
  --skill security-audit \
  --global
```

Cần agent hỗ trợ tool use + sub-agent song song, và **Node.js** (validator `validate-findings.cjs` / `validate-coverage-ledger.cjs`).

### Chạy trong Cursor (trên repo app)

```text
security audit this codebase
```

```text
find security vulnerabilities in ./src
```

```text
do a security review, output to ~/audits/my-project
```

Full audit (pen-test / “audit codebase”) ghi artifact ra thư mục output (mặc định kiểu `~/security-audit-skill/<repo>/run-<N>` nếu bạn không chỉ định). Chỉ ghi **trong** repo khi bạn chọn path mà VCS ignore — đừng commit `findings.json` nhạy cảm vào `artifacts/` trừ khi team chủ đích.

Verdict chính:

| Verdict | Nghĩa |
|---------|--------|
| `confirmed` | Có trace nguồn + kết quả quan sát được trong biên |
| `needs_validation` | Còn fact chưa resolve — **không** gắn severity |
| `rejected` | Candidate đã bị phản chứng |

### Gắn với verify / ship của kit

1. Chạy audit → đọc `REPORT.md` / `FINDINGS-DETAIL.md` (hoặc path bạn chỉ định).
2. Ticket hoá `confirmed` (và `needs_validation` nếu cần điều tra) → `/bug` hoặc `/feature` nhỏ.
3. Fix → `verify` lại → rồi mới `ship`.
4. Log ngắn trong run-log: skill ngoài kit (`security-audit`) + path report.

### Cảnh báo

- Full audit **tốn token/thời gian** (nhiều sub-agent) — scope hẹp khi có thể.
- Không có sandbox OS đúng chuẩn thì skill giữ lead ở `needs_validation` thay vì chạy target code — xem [Requirements](https://github.com/cloudflare/security-audit-skill#requirements).
- Đây **không** thay thế review pháp lý / pen-test người; cũng không thay iron law verify của kit.

### Thứ tự khuyến nghị (backend nhạy cảm)

```text
1. Cài cursor-workflow vào app
2. (optional) Ponytail hooks
3. (optional) npx skills add … --skill security-audit
4. /greenfield|/feature → grill → implement → dual-review → verify
5. Trước release: “security audit …” khi có sensitive surface → ticket fix → verify → ship → /release
```

## Install nâng cao

| Flag | Nghĩa |
|------|--------|
| _(mặc định)_ `--full` | `.cursor` + AGENTS + glossary + artifacts + templates |
| `--cursor-only` | Chỉ rules/skills/commands |
| `--dry-run` | In plan, không ghi |
| `--force` | Ghi đè conflict (backup trước) |
| `--symlink` | Symlink skill mới về kit |

## License

MIT — xem `ATTRIBUTION.md`.
