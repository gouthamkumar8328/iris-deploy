# ── Stage: Base Image ─────────────────────────────
FROM python:3.11-slim
 
# ── Set Working Directory ─────────────────────────
WORKDIR /app
 
# ── Copy and Install Dependencies FIRST ──────────
# (This layer is cached - only re-runs if requirements.txt changes)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
 
# ── Copy Application Code ─────────────────────────
COPY app/ ./app/
 
# ── Expose Port ───────────────────────────────────
EXPOSE 8080
 
# ── Start Command ─────────────────────────────────
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
