# Quarto blog — local preview and Docker

This repository contains a small Quarto website (blog). Files added:

- `_quarto.yml` — site configuration
- `index.qmd` — homepage
- `about.qmd` — about page with a strong legal disclaimer
- `_includes/footer.html` — site footer containing a footnote stating "Views are my own"

Quick local preview (if you have Quarto installed):

```bash
quarto preview --host 0.0.0.0 --port 4000
```

Using Docker (this repo includes a `Dockerfile` and a devcontainer `docker-compose.yml`):

Build and start the container:

```bash
docker-compose up --build -d
```

Then run Quarto preview inside the running container (which exposes port 4000):

```bash
docker-compose run --service-ports mywritings quarto preview --host 0.0.0.0 --port 4000
```

Notes:

- The legal text provided in `about.qmd` is a general-purpose disclaimer and is not a substitute for legal advice. If you need a tailored, legally binding disclaimer, consult a qualified attorney.
- Replace the placeholder contact info and name with your real details.
# writings
This is a personal blog to track writings that are educational, research, and random topics 
