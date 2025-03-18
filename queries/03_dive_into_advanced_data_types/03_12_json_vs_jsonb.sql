-- json uses less space compared to jsonb
-- json data type saves the json data as plain text but jsonb is bigger because jsonb makes sure your data is deconstructed and parsed from JSON and saves the json info as binary with some additional info for the postgres to query and do other operations on it in a performant way
SELECT pg_typeof('{"username": "kirandash"}'::json), pg_column_size('{"username": "kirandash"}'::json), pg_typeof('{"username": "kirandash"}'::jsonb), pg_column_size('{"username": "kirandash"}'::jsonb);

-- json here will save the white space but jsonb will not because jsonb saves only the binary info not as text
-- json will not remove duplicates but jsonb will remove duplicates
-- json will ask for valid JSON but will not follow all the JSON rules strictly wherease jsonb is more strict
SELECT '{"username":        "kirandash", "username": "sourav"}'::json, '{"username":          "kirandash", "username": "sourav"}'::jsonb;

-- JSONB operations:
SELECT '
{
  "name": "canvaspro-ai",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "db:generate": "npx drizzle-kit generate",
    "db:migrate": "npx drizzle-kit migrate",
    "db:studio": "npx drizzle-kit studio"
  },
  "dependencies": {
    "@auth/core": "^0.37.0",
    "@auth/drizzle-adapter": "^1.7.0",
    "@bytescale/upload-widget-react": "^4.19.0",
    "@hono/auth-js": "^1.0.11",
    "@hono/zod-validator": "^0.3.0",
    "@neondatabase/serverless": "^0.10.1",
    "@radix-ui/react-avatar": "^1.1.1",
    "@radix-ui/react-dialog": "^1.1.2",
    "@radix-ui/react-dropdown-menu": "^2.1.1",
    "@radix-ui/react-icons": "^1.3.0",
    "@radix-ui/react-label": "^2.1.0",
    "@radix-ui/react-scroll-area": "^1.1.0",
    "@radix-ui/react-separator": "^1.1.0",
    "@radix-ui/react-slider": "^1.2.0",
    "@radix-ui/react-slot": "^1.1.0",
    "@radix-ui/react-tooltip": "^1.1.2",
    "@tanstack/react-query": "^5.56.2",
    "@tanstack/react-query-devtools": "^5.58.0",
    "bcryptjs": "^2.4.3",
    "class-variance-authority": "^0.7.0",
    "clsx": "^2.1.1",
    "dayjs": "^1.11.13",
    "drizzle-orm": "^0.34.1",
    "drizzle-zod": "^0.5.1",
    "fabric": "5.3.0-browser",
    "hono": "^4.6.2",
    "jsdom": "^25.0.0",
    "lodash.debounce": "^4.0.8",
    "lucide-react": "^0.439.0",
    "material-colors": "^1.2.6",
    "next": "14.2.8",
    "next-auth": "^5.0.0-beta.22",
    "next-themes": "^0.3.0",
    "react": "^18",
    "react-color": "^2.19.3",
    "react-dom": "^18",
    "react-icons": "^5.3.0",
    "react-use": "^17.5.1",
    "replicate": "^0.34.0",
    "sonner": "^1.5.0",
    "stripe": "^17.2.1",
    "tailwind-merge": "^2.5.2",
    "tailwindcss-animate": "^1.0.7",
    "unsplash-js": "^7.0.19",
    "use-file-picker": "^2.1.2",
    "uuidv4": "^6.2.13",
    "zod": "^3.23.8",
    "zustand": "^5.0.0"
  },
  "devDependencies": {
    "@types/bcryptjs": "^2.4.6",
    "@types/fabric": "5.3.0",
    "@types/lodash.debounce": "^4.0.9",
    "@types/material-colors": "^1.2.3",
    "@types/node": "^20",
    "@types/react": "^18",
    "@types/react-color": "^3.0.12",
    "@types/react-dom": "^18",
    "dotenv": "^16.4.5",
    "drizzle-kit": "^0.25.0",
    "eslint": "^8",
    "eslint-config-next": "14.2.8",
    "postcss": "^8",
    "tailwindcss": "^3.4.1",
    "typescript": "^5"
  }
}
'
-- ::jsonb->'version'
-- accessing nested object
::jsonb->'scripts'->>'build';