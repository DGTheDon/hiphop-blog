#!/bin/bash

# Stop any running PocketBase instances
killall pocketbase > /dev/null 2>&1

# Clean up old database and migrations
rm -rf ./pb_data
rm -rf ./pb_migrations
mkdir ./pb_migrations

# Start PocketBase in the background
./pocketbase serve > /dev/null 2>&1 &

# Wait for PocketBase to start
sleep 2

# Create the articles collection
./pocketbase admin collection create articles \
  --schema="title:text(required,max=150),slug:text(required,unique),subtitle:text(max=200),content:text(required),excerpt:text(required,max=300),author:relation(users,required),category:select(news,reviews,interviews,features,opinion,breaking),tags:json,featured_image:file(required),featured_image_alt:text(required),featured_image_caption:text,gallery_images:file(multiple),status:select(draft,published,archived),priority:select(normal,high,breaking),views:number,likes:number,shares:number,published_at:datetime,seo_title:text(max=60),seo_description:text(max=160),reading_time:number,external_links:json,ai_generated_summary:text,trending_score:number" \
  --indexes="slug:unique"

# Add some sample data
./pocketbase admin record create articles \
  --data='{"title": "First Post", "slug": "first-post", "content": "This is the first post.", "excerpt": "This is the excerpt for the first post.", "author": "users/", "category": "news", "featured_image_alt": "alt text"}'

./pocketbase admin record create articles \
  --data='{"title": "Second Post", "slug": "second-post", "content": "This is the second post.", "excerpt": "This is the excerpt for the second post.", "author": "users/", "category": "reviews", "featured_image_alt": "alt text"}'

echo "Setup complete. You can now start the development server with 'npm run dev'"
