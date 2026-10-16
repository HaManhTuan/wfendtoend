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
6. Bảo agent **implement** → xem `npm test` / `npm run build` (verify).
7. Bảo **commit** khi hài lòng (`ship`).

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
  → implement (+ tdd) → dual-review → verify → ship → retro
```

## Nguyên tắc cứng

1. **Grill trước code** (hoặc `skip grill:` có chữ ký user).  
2. **Slash + run-log** = dấu vết cho người đọc sau.  
3. **Artifacts trên git** (`artifacts/**/*.md`).  
4. **Verify có exit code** trước khi nói xong.  
5. **Static FE** có thể verify bằng build/smoke, không ép Jest giả.

## FE design skills (stack — không nằm trong core)

Xem bảng chọn + lệnh cài trong mục “Optional — frontend design” trước đây; tóm tắt:

```bash
npx skills add anthropics/skills --skill frontend-design
npx skills add leonxlnx/taste-skill --skill design-taste-frontend   # optional
npx skills add evondev/evondevKit -a cursor                         # wireframe gate
```

Dùng trên **repo app**, không copy vào core kit này.

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
