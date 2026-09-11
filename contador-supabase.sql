-- ============================================================
-- Contador do Linktree KING METODOS
-- Rodar UMA VEZ no Supabase (projeto jmkshpqarmctbchoxadu)
-- SQL Editor > New query > colar > Run
-- ATENCAO: desligue o Google Tradutor antes de colar
-- ============================================================

create table if not exists public.linktree_eventos (
  id         bigserial primary key,
  evento     text not null,          -- 'visita' ou 'clique'
  botao      text,                   -- nome do botao clicado
  visitante  text,                   -- id anonimo do navegador
  criado_em  timestamptz not null default now()
);

create index if not exists linktree_eventos_criado_em_idx
  on public.linktree_eventos (criado_em desc);

alter table public.linktree_eventos enable row level security;

drop policy if exists "linktree insert publico" on public.linktree_eventos;
create policy "linktree insert publico"
  on public.linktree_eventos for insert
  to anon, authenticated
  with check (true);

drop policy if exists "linktree leitura publica" on public.linktree_eventos;
create policy "linktree leitura publica"
  on public.linktree_eventos for select
  to anon, authenticated
  using (true);
