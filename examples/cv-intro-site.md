# Ví dụ Cursor: website FE giới thiệu CV

Slug: `cv-intro`  
Đối tượng: người chỉ biết “một website chỉ FE giới thiệu CV”, **chưa** biết phong cách thiết kế, nội dung, stack, hosting.

Đây là **kịch bản bạn gõ gì / agent làm gì**, không phải code mẫu của site. Artifact thật nằm trong repo app sau khi chạy.

---

## Bạn bắt đầu với gì?

```text
Tôi muốn một website chỉ frontend giới thiệu CV.
Chưa biết phong cách thiết kế. Chưa có nội dung chi tiết.
```

Đủ để mở `/greenfield`. **Không** bảo “code luôn”. Agent phải grill (hoặc bạn gõ `skip grill: …`).

---

## Bản đồ slash (từ đầu tới audience nhận bản)

| # | Bạn gõ (Cursor chat Agent) | Việc xảy ra | Artifact chính |
|---|----------------------------|-------------|----------------|
| 0 | _(shell, ngoài Cursor)_ | Tạo repo + cài kit | `.cursor/`, `AGENTS.md` |
| 1 | `/greenfield` + mô tả ngắn | setup (nếu thiếu) → discover / grill | `artifacts/reviews/cv-intro-run-log.md` |
| 2 | Trả lời từng câu grill | Q&A đầy dần | `artifacts/research/cv-intro.md` |
| 3 | `/prototype` _(khi design còn mở)_ | Probe UI throwaway, **không** ship | ghi learnings vào research |
| 4 | _(tiếp)_ approve SPEC | Khóa *what* | `artifacts/specs/cv-intro.md` |
| 5 | _(agent)_ `lock-scope` | Xác nhận in/out | cùng SPEC (không file trùng nếu đã đủ) |
| 6 | _(agent)_ plan → tickets | Lát cắt dọc | `artifacts/plans/…`, `artifacts/tickets/…` |
| 7 | `Implement T1` / `làm frontier` | code + TDD hoặc build/smoke | source trong app |
| 8 | _(agent)_ dual-review → verify | standards ‖ spec + bảng AC | `artifacts/reviews/cv-intro*.md` |
| 9 | `Commit giúp. Đừng push.` | **ship** = git | commit + optionally PR |
| 10 | `/release` | Audience nhận bản (Pages / Netlify / …) | `artifacts/reviews/cv-intro-release.md` |
| 11 | _(tuỳ)_ `/retro` | Metric success đã nhúc chưa? | chat + run-log |

`ship` ≠ user đang xem site. User/public xem được là sau `/release`.

---

## Bước 0 — Repo app (shell)

```bash
mkdir -p /path/to/cv-intro && cd /path/to/cv-intro
git init -b main

# Từ bản clone kit wfendtoend:
/path/to/wfendtoend/scripts/install-to-project.sh /path/to/cv-intro
```

Mở **`/path/to/cv-intro`** trong Cursor (không mở folder kit).

FE nặng — khuyến nghị một lần trên máy (không nhét vào core kit):

```bash
npx skills add https://github.com/vercel-labs/skills --skill find-skills
npx skills add anthropics/skills --skill frontend-design
# optional smoke sau này:
# npm i -g agent-browser && agent-browser install
# npx skills add https://github.com/vercel-labs/agent-browser --skill agent-browser
```

---

## Bước 1 — Mở pipeline

Trong Cursor **Agent** chat:

```text
/greenfield
```

Ngay sau đó (cùng tin hoặc tin kế):

```text
Website chỉ FE giới thiệu CV / portfolio cá nhân.
Chưa biết phong cách thiết kế. Chưa có nội dung chi tiết.
MVP: một người xem CV trên desktop + mobile. Không backend, không form liên hệ gửi mail thật.
```

Agent ghi run-log (`Cursor command: /greenfield`) và bắt đầu **một câu hỏi mỗi lượt**.

---

## Bước 2 — Grill (bạn trả lời)

Ví dụ chuỗi câu agent có thể hỏi, và câu trả lời mẫu đủ để khóa MVP:

| Lượt | Agent hỏi (gợi ý) | Bạn trả lời mẫu |
|------|-------------------|-----------------|
| 1 | Site cho ai xem? | Nhà tuyển dụng / người muốn biết mình làm gì |
| 2 | Ngôn ngữ? | Tiếng Việt trước; EN sau (out of scope MVP) |
| 3 | Mục nào bắt buộc trên một trang? | Tên + vai trò, tóm tắt, kinh nghiệm, kỹ năng, cách liên hệ (mailto / link) |
| 4 | Nội dung lấy từ đâu? | Placeholder có cấu trúc trong repo (`content/` hoặc hằng số). Tôi sẽ thay chữ sau |
| 5 | Stack? | Static HTML/CSS hoặc Vite + vanilla. Không CMS |
| 6 | Host sau này? | GitHub Pages (chưa cần làm ở grill — ghi assumption) |
| 7 | Phong cách? | **Chưa biết** → agent nên đề xuất `/prototype` trước khi lock SPEC |

Muốn bỏ grill (không khuyến nghị):

```text
skip grill: một trang CV FE static; section: hero, experience, skills, contact mailto;
placeholder content; chưa chọn visual — sẽ prototype trước khi approve SPEC
```

---

## Bước 3 — Design chưa rõ → `/prototype`

Khi agent (hoặc bạn) thấy visual còn mở:

```text
/prototype
Thử 2 hướng visual cho cv-intro: (A) tối giản editorial serif, (B) kỹ thuật monospace.
Throwaway. Không coi là production. Ghi learnings vào research.
```

Sau khi bạn chọn hướng (ví dụ A):

```text
Chọn hướng A. Quay lại discover / SPEC với quyết định đó.
```

Prototype **không** thay SPEC. Không `/release` bản prototype.

---

## Bước 4 — Approve SPEC → scope → plan → tickets

Agent viết `artifacts/specs/cv-intro.md`.

- Site một trang, ít seam → profile **`one-seam`** (hoặc `full` nếu nhiều trang / i18n).
- Sensitive surface: thường `none` (static, không auth/PII/payment). Mailto công khai không tính PII pipeline.

Bạn đọc SPEC rồi:

```text
SPEC ok.
```

Agent chạy `lock-scope` (xác nhận in/out trên SPEC, không copy sang file thứ hai nếu đã đủ) → `write-plan` → `risk-assess` → `to-tickets`.

Ví dụ frontier ticket (minh họa):

| ID | Kind | Done when (ý) |
|----|------|----------------|
| T1 | behavior | Trang build được; hero + 4 section có landmark |
| T2 | behavior | Mobile đọc được (viewport / smoke) |
| T3 | chore | Nội dung placeholder tách khỏi layout |

Tracker mặc định `local-markdown` → **không** tạo GitHub issue. Chỉ khi `docs/agents/issue-tracker.md` = github mới có `publish-tickets` + preview.

Bạn duyệt plan:

```text
Plan ok. Tickets ok. Implement frontier.
```

---

## Bước 5 — Implement → review → verify

Không cần slash riêng. Trong chat:

```text
Implement T1 rồi T2. TDD hoặc build/smoke theo tdd skill (static FE).
```

Agent: `implement` + `tdd` (static → build / smoke, không bịa Jest) → `dual-review` → `verify`.

Bạn mở `artifacts/reviews/cv-intro-verify.md`: mỗi AC / Done when có lệnh + exit code. Suite xanh nhưng không map AC = **không pass**.

Shell bạn có thể tự chạy (tuỳ stack agent chọn):

```bash
npm install   # nếu có
npm run build
# hoặc mở index.html / npm run preview
```

---

## Bước 6 — Ship (git only)

```text
Commit giúp với message rõ. Đừng push.
```

Hoặc nếu muốn PR:

```text
Ship: commit và mở PR. Đừng merge.
```

Đây là **ship**. Site chưa coi là “đã lên cho người xem”.

---

## Bước 7 — Release (audience)

Khi bạn muốn nhà tuyển dụng / bạn bè mở được URL:

```text
/release
Audience: GitHub Pages (hoặc Netlify) cho cv-intro.
Verify đã pass. Rollback: tắt Pages / revert commit publish.
Tôi là owner — ký release sau khi agent điền artifact.
```

Agent ghi `artifacts/reviews/cv-intro-release.md` (changelog, migration=`none`, rollback, sensitive=`none`). Chỉ chạy lệnh deploy **nếu repo đã có** và bạn bảo chạy.

Ví dụ lệnh deploy (chỉ khi bạn đã chọn hosting và có script):

```bash
# ví dụ — không phải bắt buộc của kit
npm run deploy
# hoặc gh-pages / netlify deploy --prod
```

---

## Bước 8 — Retro (tuỳ)

```text
/retro
Success metric trong SPEC (ví dụ: một người lạ đọc hết CV trong 1 phút trên mobile) — đã đo chưa?
```

---

## Slash **không** cần trong kịch bản này

| Slash | Vì sao bỏ qua |
|-------|----------------|
| `/feature` | Đây là sản phẩm mới → `/greenfield` |
| `/bug` | Chưa có regression |
| `/wayfinder` | Một trang MVP, quyết định design xử lý bằng `/prototype`, không phải epic nhiều milestone |
| `/triage` | Không có inbox issue |
| `/architecture` | Chưa có codebase sâu cần survey |
| `/teach` | Đang ship product, không phải buổi học |

---

## Checklist “xong thật”

- [ ] Research có Q&A **hoặc** Waiver  
- [ ] SPEC approved (có visual đã chọn sau prototype nếu ban đầu “chưa biết”)  
- [ ] Plan + tickets; run-log có `/greenfield`  
- [ ] Verify pass + bảng acceptance  
- [ ] Ship = commit/PR nếu bạn yêu cầu  
- [ ] `/release` + owner ký khi có URL cho người khác  

---

## Gợi ý câu mở nếu bạn copy-paste một phát

```text
/greenfield

Website chỉ FE giới thiệu CV cá nhân (một trang).
Chưa biết phong cách thiết kế — khi tới visual hãy đề xuất /prototype trước khi tôi approve SPEC.
Chưa có nội dung thật: dùng placeholder có cấu trúc.
MVP: hero (tên + vai trò), tóm tắt, kinh nghiệm, kỹ năng, liên hệ mailto.
Không backend, không CMS, không i18n trong MVP.
Stack đề xuất giúp (static hoặc Vite). Hosting giả định GitHub Pages (ghi assumption).
Grill từng câu. Đừng code trước khi tôi approve SPEC.
```
