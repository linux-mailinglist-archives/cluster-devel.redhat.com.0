Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 39A3323DAD2
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wa9l1EY/oo2iksoJoGQqr0+wJXFPMKLdRwFG31ldW2M=;
	b=Xvb3kWwEqBYigTJd/WEyYyE7ZEy2beA9H7+cY82LKR0sDqnj/IpXfYRk1oLyMCWMDA3IZ2
	qdLaFhoA+grKth9nNmHPQAM3CE8SnYY0XT2lWfbYgpFGYVFZapXtyZGib7u0I2oSi40qtS
	hf9Au6pFPpJoukl+uSwW3eHfuGE5Oxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-62aBqpbXP5ygTehPsWDkBA-1; Thu, 06 Aug 2020 09:38:26 -0400
X-MC-Unique: 62aBqpbXP5ygTehPsWDkBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1E0C10932EB;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B26CB5DA79;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FC209691F;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcH7k030663 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C2EBB60C47; Thu,  6 Aug 2020 13:38:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAFA860BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:16 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:39 +0100
Message-Id: <20200806133807.111280-5-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 04/32] glocktop: Improve mount info handling
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Using static arrays for the mount points causes glocktop to impose some
arbitrary limits, like 80 chars for device and mount point paths.
Improve on this situation by keeping the mount point info in a simple
linked list and add some error handling in various places. Also remove a
bunch of stale code from read_superblock. No more gfs2_buffer_heads in
glocktop as a side effect.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/glocktop/glocktop.c | 189 ++++++++++++++++++++-------------------
 1 file changed, 99 insertions(+), 90 deletions(-)

diff --git a/gfs2/glocktop/glocktop.c b/gfs2/glocktop/glocktop.c
index 2f74a7f2..bd7fcf02 100644
--- a/gfs2/glocktop/glocktop.c
+++ b/gfs2/glocktop/glocktop.c
@@ -26,7 +26,6 @@
 
 #define MAX_GLOCKS 20
 #define MAX_LINES 6000
-#define MAX_MOUNT_POINTS 100
 #define MAX_FILES 512
 #define MAX_CALLTRACE_LINES 4
 #define TITLE1 "glocktop - GFS2 glock monitor"
@@ -144,7 +143,7 @@ enum summary_types {
 	stypes = 7,
 };
 
-char debugfs[PATH_MAX];
+char *debugfs;
 int termcols = 80, termlines = 30, done = 0;
 unsigned glocks = 0;
 const char *termtype;
@@ -152,10 +151,14 @@ WINDOW *wind;
 int bufsize = 4 * 1024 * 1024;
 char *glock[MAX_GLOCKS];
 int iterations = 0, show_reservations = 0, iters_done = 0;
-char devices[MAX_MOUNT_POINTS][80];
-char mount_points[MAX_MOUNT_POINTS][80];
-int fs_fd[MAX_MOUNT_POINTS];
-int mounted = 0;
+struct mount_point {
+	struct mount_point *next;
+	char *device;
+	char *dir;
+	int fd;
+	struct gfs2_sb sb;
+};
+struct mount_point *mounts;
 char dlmwlines[100][96]; /* waiters lines */
 char dlmglines[MAX_LINES][97]; /* granted lines */
 char contended_filenames[MAX_FILES][PATH_MAX];
@@ -165,11 +168,6 @@ int line = 0;
 const char *prog_name;
 char dlm_dirtbl_size[32], dlm_rsbtbl_size[32], dlm_lkbtbl_size[32];
 int bsize = 0;
-struct gfs2_sb sd_sb[MAX_MOUNT_POINTS];
-int sd_diptrs = 0, sd_inptrs = 0;
-uint64_t sd_heightsize[GFS2_MAX_META_HEIGHT];
-uint64_t sd_jheightsize[GFS2_MAX_META_HEIGHT];
-int sd_max_height, sd_max_jheight;
 char print_dlm_grants = 1;
 char *gbuf = NULL; /* glocks buffer */
 char *gpos = NULL;
@@ -225,89 +223,104 @@ static void UpdateSize(int sig)
 	signal(SIGWINCH, UpdateSize);
 }
 
-static void read_superblock(int fd, int mntpt)
+static int read_superblock(int fd, struct gfs2_sb *sb)
 {
-	struct gfs2_sbd sbd = { .device_fd = fd, .bsize = GFS2_BASIC_BLOCK };
-	struct gfs2_buffer_head *bh;
-	int x;
-	uint64_t space = 0;
+	ssize_t r;
+	char *buf;
 
 	ioctl(fd, BLKFLSBUF, 0);
-	bh = bread(&sbd, GFS2_SB_ADDR);
-	gfs2_sb_in(&sd_sb[mntpt], bh->b_data);
-	bsize = sd_sb[mntpt].sb_bsize;
+	buf = calloc(1, GFS2_BASIC_BLOCK);
+	if (buf == NULL) {
+		perror("Failed to read superblock");
+		return -1;
+	}
+	r = pread(fd, buf, GFS2_BASIC_BLOCK, GFS2_BASIC_BLOCK * GFS2_SB_ADDR);
+	if (r != GFS2_BASIC_BLOCK) {
+		perror("Failed to read superblock");
+		free(buf);
+		return -1;
+	}
+	gfs2_sb_in(sb, buf);
+	free(buf);
+
+	bsize = sb->sb_bsize;
 	if (!bsize)
 		bsize = 4096;
-	sd_inptrs = (bsize - sizeof(struct gfs2_meta_header)) /
-		sizeof(uint64_t);
-	sd_diptrs = (bsize - sizeof(struct gfs2_dinode)) /
-		sizeof(uint64_t);
-	sd_heightsize[0] = bsize - sizeof(struct gfs2_dinode);
-	sd_heightsize[1] = bsize * sd_diptrs;
-	for (x = 2; ; x++) {
-		space = sd_heightsize[x - 1] * sd_inptrs;
-		if (space / sd_inptrs != sd_heightsize[x - 1] ||
-		    space % sd_inptrs != 0)
-			break;
-		sd_heightsize[x] = space;
-	}
-	sd_jheightsize[0] = bsize - sizeof(struct gfs2_dinode);
-	sd_jheightsize[1] = (bsize - sizeof(struct gfs2_meta_header)) *
-		sd_diptrs;
-	for (x = 2; ; x++){
-		space = sd_jheightsize[x - 1] * sd_inptrs;
-		if (space / sd_inptrs != sd_jheightsize[x - 1] ||
-		    space % sd_inptrs != 0)
-			break;
-		sd_jheightsize[x] = space;
+	return 0;
+}
+
+static void free_mounts(void)
+{
+	struct mount_point *mntp = mounts;
+
+	while (mntp != NULL) {
+		struct mount_point *nextp = mntp->next;
+
+		close(mntp->fd);
+		free(mntp);
+		mntp = nextp;
 	}
-	sd_max_jheight = x;
+	mounts = NULL;
 }
 
 static int parse_mounts(void)
 {
-	char str[PATH_MAX], dev[PATH_MAX], mnt[PATH_MAX], mtype[PATH_MAX];
-	char opts[PATH_MAX];
+	struct mount_point **mntp = &mounts;
+	struct mntent *mnt;
 	FILE *fp;
 
-	memset(debugfs, 0, sizeof(debugfs));
-	memset(mount_points, 0, sizeof(mount_points));
-	memset(devices, 0, sizeof(devices));
-
-	fp = fopen("/proc/mounts", "rt");
+	fp = setmntent("/proc/mounts", "r");
 	if (fp == NULL) {
 		perror("/proc/mounts");
 		return 1;
 	}
-	while (fgets(str, sizeof(str) - 1, fp)) {
-		sscanf(str, "%s %s %s %s", dev, mnt, mtype, opts);
-		if (!strcmp(mtype, "debugfs")) {
-			strcpy(debugfs, mnt);
+	while ((mnt = getmntent(fp)) != NULL) {
+		size_t devlen = strlen(mnt->mnt_fsname);
+		size_t dirlen = strlen(mnt->mnt_dir);
+		struct mount_point *newmnt;
+
+		if (strcmp(mnt->mnt_type, "debugfs") == 0) {
+			if (debugfs == NULL)
+				debugfs = strdup(mnt->mnt_dir);
 			continue;
 		}
-		if (strcmp(mtype, "gfs2")) /* if not gfs2 */
+		if (strcmp(mnt->mnt_type, "gfs2") != 0)
 			continue;
 
-		strncpy(mount_points[mounted], mnt, 79);
-		mount_points[mounted][79] = '\0';
-		strncpy(devices[mounted], dev, 79);
-		devices[mounted][79] = '\0';
-
-		/* Now find out the mount point's file system name */
-		fs_fd[mounted] = open(dev, O_RDONLY);
-		if (fs_fd[mounted])
-			read_superblock(fs_fd[mounted], mounted);
-		mounted++;
+		newmnt = calloc(1, sizeof(*newmnt) + devlen + 1 + dirlen + 1);
+		if (newmnt == NULL) {
+			perror("Failed to gather mount points");
+			return 1;
+		}
+		newmnt->device = (char *)(newmnt + 1);
+		newmnt->dir = newmnt->device + devlen + 1;
+		strcpy(newmnt->device, mnt->mnt_fsname);
+		strcpy(newmnt->dir, mnt->mnt_dir);
+		newmnt->fd = open(newmnt->device, O_RDONLY);
+
+		if (newmnt->fd < 0) {
+			fprintf(stderr, "Failed to open gfs2 filesystem '%s': %s\n",
+			        newmnt->device, strerror(errno));
+			free(newmnt);
+			continue;
+		}
+		if (read_superblock(newmnt->fd, &newmnt->sb) != 0) {
+			free(newmnt);
+			continue;
+		}
+		*mntp = newmnt;
+		mntp = &newmnt->next;
 	}
-	if (debugfs[0] == '\0') {
-		if (mount("debugfs", "/sys/kernel/debug", "debugfs", 0, NULL)){
-			fprintf(stderr, "Unable to mount debugfs.\n");
-			fprintf(stderr, "Please mount it manually.\n");
-			exit(-1);
+	endmntent(fp);
+	if (debugfs == NULL) {
+		debugfs = strdup("/sys/kernel/debug");
+		if (!debugfs || mount("debugfs", "/sys/kernel/debug", "debugfs", 0, NULL)) {
+			perror("debugfs not mounted and an attempt to mount it failed");
+			free(debugfs);
+			free_mounts();
+			return 1;
 		}
-		strcpy(debugfs, "/sys/kernel/debug");
 	}
-	fclose(fp);
 	return 0;
 }
 
@@ -562,19 +575,17 @@ void print_it(const char *label, const char *fmt, const char *fmt2, ...)
 static void display_filename(int fd, unsigned long long block,
 			     unsigned long long dirarray[256], int subdepth)
 {
+	struct mount_point *mp;
 	int i, subs;
-	char *mntpt = NULL;
 	char blk[32];
 	DIR *dir = NULL;
 	struct dirent *dent;
 
-	for (i = 0; i < mounted; i++) {
-		if (fd == fs_fd[i]) {
-			mntpt = mount_points[i];
+	for (mp = mounts; mp != NULL; mp = mp->next) {
+		if (fd == mp->fd)
 			break;
-		}
 	}
-	if (i == mounted)
+	if (mp == NULL)
 		return;
 	for (i = 0; i < contended_count; i++) {
 		if (contended_blocks[i] == block) {
@@ -584,7 +595,7 @@ static void display_filename(int fd, unsigned long long block,
 	sprintf(blk, "%lld", block);
 	if (i >= contended_count) {
 		memset(contended_filenames[i], 0, PATH_MAX);
-		strcat(contended_filenames[i], mntpt);
+		strcat(contended_filenames[i], mp->dir);
 		for (subs = subdepth - 2; subs >= 0; subs--) {
 			dir = opendir(contended_filenames[i]);
 			while ((dent = readdir(dir))) {
@@ -655,26 +666,28 @@ static const char *show_inode(const char *id, int fd, unsigned long long block)
 static const char *show_details(const char *id, const char *fsname, int btype,
 				int trace_dir_path)
 {
-	int mnt_num;
 	unsigned long long block = 0;
 	const char *blk_type = NULL;
+	struct mount_point *mp;
 	FILE *dlmf;
 
 	/* Figure out which mount point corresponds to this debugfs id */
-	for (mnt_num = 0; mnt_num < mounted; mnt_num++) {
+	for (mp = mounts; mp != NULL; mp = mp->next) {
 		char *p;
 
-		p = strchr(sd_sb[mnt_num].sb_locktable, ':');
+		p = strchr(mp->sb.sb_locktable, ':');
 		if (!p)
 			continue;
 		p++;
 		if (!strcmp(p, fsname))
 			break;
 	}
+	if (mp == NULL)
+		return "unknown";
 	memset(dlm_dirtbl_size, 0, sizeof(dlm_dirtbl_size));
 	memset(dlm_rsbtbl_size, 0, sizeof(dlm_rsbtbl_size));
 	memset(dlm_lkbtbl_size, 0, sizeof(dlm_lkbtbl_size));
-	if (!strcmp(sd_sb[mnt_num].sb_lockproto, "lock_dlm")) {
+	if (!strcmp(mp->sb.sb_lockproto, "lock_dlm")) {
 		char *sp;
 		char *p;
 
@@ -720,16 +733,12 @@ static const char *show_details(const char *id, const char *fsname, int btype,
 		strcpy(dlm_lkbtbl_size, "nolock");
 	}
 
-	if (mnt_num >= mounted) /* can't find the right superblock */
-		return "unknown";
-
 	/* Read the inode in so we can see its type. */
 	sscanf(id, "%llx", &block);
 	if (block) {
 		if (btype == 2)
 			if (trace_dir_path)
-				blk_type = show_inode(id, fs_fd[mnt_num],
-						      block);
+				blk_type = show_inode(id, mp->fd, block);
 			else
 				blk_type = "";
 		else
@@ -1658,7 +1667,7 @@ int main(int argc, char **argv)
 	int refresh_time = REFRESH_TIME;
 	fd_set readfds;
 	char string[96];
-	int ch, i, dlmwaiters = 0, dlmgrants = 0;
+	int ch, dlmwaiters = 0, dlmgrants = 0;
 	int cont = TRUE, optchar;
 	int trace_dir_path = 0;
 	int show_held = 1, help = 0;
@@ -1894,10 +1903,10 @@ int main(int argc, char **argv)
 		if (iterations && iters_done >= iterations)
 			break;
 	}
-	for (i = 0; i < mounted; i++)
-		close(fs_fd[i]);
+	free_mounts();
 	free(gbuf);
 	free(dbuf);
+	free(debugfs);
 	if (interactive) {
 		refresh();
 		endwin();
-- 
2.26.2

