Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DA5922ED0F7
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Jan 2021 14:42:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610026978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=R4N192FdrbLDE4QPeiZHOyOgpZq53/zkZELHxYAe1VM=;
	b=FNQT0lrdHLbLUb7Hv4Q3IFcdiCpEAsOsjyfhfatlD7V2rT2sxD3T1vVpJpuNhwvGq6KcOZ
	DxN+cVDUHS4P862WjRVD3eaMuaFFqzBtENSgIKW/NN6uQN38uB6XoDt1Pyme49wJ08QNzb
	m6CHYIChiKvDYEb+cAs0SGiZPyFNXUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-IxdZCRZnPHS-V-Q7AcpYzw-1; Thu, 07 Jan 2021 08:42:55 -0500
X-MC-Unique: IxdZCRZnPHS-V-Q7AcpYzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C2EB8049C0;
	Thu,  7 Jan 2021 13:42:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 166ED19C66;
	Thu,  7 Jan 2021 13:42:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEBA6180954D;
	Thu,  7 Jan 2021 13:42:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 107DgmuU028884 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 7 Jan 2021 08:42:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3B8A219809; Thu,  7 Jan 2021 13:42:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3143F197FA
	for <cluster-devel@redhat.com>; Thu,  7 Jan 2021 13:42:47 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  7 Jan 2021 13:42:38 +0000
Message-Id: <20210107134240.386547-2-anprice@redhat.com>
In-Reply-To: <20210107134240.386547-1-anprice@redhat.com>
References: <20210107134240.386547-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/3] mkfs.gfs2: Add extended option for
	specifying format version
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Add -o format=<number> to allow testing of newer format versions. The
default value is taken from GFS2_FORMAT_FS in the
include/linux/gfs2_ondisk.h kernel header.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/initialize.c    |  2 +-
 gfs2/libgfs2/libgfs2.h    |  5 ++++-
 gfs2/libgfs2/structures.c |  4 ++--
 gfs2/man/mkfs.gfs2.8      |  3 +++
 gfs2/mkfs/main_mkfs.c     | 26 +++++++++++++++++++++++++-
 tests/mkfs.at             | 10 ++++++++++
 6 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index ecda56e2..b5bcecfa 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -1291,7 +1291,7 @@ static int sb_repair(struct gfs2_sbd *sdp)
 			log_crit(_("Error reading root inode: %s\n"), strerror(errno));
 			return -1;
 		}
-		lgfs2_sb_init(&sb, sdp->bsize);
+		lgfs2_sb_init(&sb, sdp->bsize, GFS2_FORMAT_FS);
 		strcpy(sb.sb_lockproto, GFS2_DEFAULT_LOCKPROTO);
 		strcpy(sb.sb_locktable, "unknown");
 		sb.sb_master_dir = sdp->master_dir->i_di.di_num;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index e815b5d7..6973c6f3 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -325,6 +325,9 @@ struct metapath {
 #define GFS2_MIN_RGSIZE             (32)
 #define GFS2_MAX_RGSIZE             (2048)
 
+#define LGFS2_FS_FORMAT_MIN (1801)
+#define LGFS2_FS_FORMAT_MAX (1802)
+
 /* meta.c */
 extern const struct lgfs2_metadata lgfs2_metadata[];
 extern const unsigned lgfs2_metadata_size;
@@ -676,7 +679,7 @@ static inline unsigned int rgrp_size(struct rgrp_tree *rgrp)
 
 /* structures.c */
 extern int build_master(struct gfs2_sbd *sdp);
-extern void lgfs2_sb_init(struct gfs2_sb *sb, unsigned bsize);
+extern void lgfs2_sb_init(struct gfs2_sb *sb, unsigned bsize, unsigned format);
 extern int lgfs2_sb_write(const struct gfs2_sb *sb, int fd, const unsigned bsize);
 extern int build_journal(struct gfs2_sbd *sdp, int j,
 			 struct gfs2_inode *jindex);
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 5cc2dd01..79095efc 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -53,13 +53,13 @@ int build_master(struct gfs2_sbd *sdp)
 /**
  * Initialise a gfs2_sb structure with sensible defaults.
  */
-void lgfs2_sb_init(struct gfs2_sb *sb, unsigned bsize)
+void lgfs2_sb_init(struct gfs2_sb *sb, unsigned bsize, unsigned format)
 {
 	memset(sb, 0, sizeof(struct gfs2_sb));
 	sb->sb_header.mh_magic = GFS2_MAGIC;
 	sb->sb_header.mh_type = GFS2_METATYPE_SB;
 	sb->sb_header.mh_format = GFS2_FORMAT_SB;
-	sb->sb_fs_format = GFS2_FORMAT_FS;
+	sb->sb_fs_format = format;
 	sb->sb_multihost_format = GFS2_FORMAT_MULTI;
 	sb->sb_bsize = bsize;
 	sb->sb_bsize_shift = ffs(bsize) - 1;
diff --git a/gfs2/man/mkfs.gfs2.8 b/gfs2/man/mkfs.gfs2.8
index 35e355a5..58742dea 100644
--- a/gfs2/man/mkfs.gfs2.8
+++ b/gfs2/man/mkfs.gfs2.8
@@ -86,6 +86,9 @@ probing the device or specified with the
 and
 .I sunit
 extended options.
+.TP
+.BI format= <number>
+Set the filesystem format version. Testing only.
 .RE
 .TP
 \fB-p\fP \fIprotocol\fR
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 17643e59..5e34ca1f 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -81,6 +81,7 @@ static void print_ext_opts(void)
 		"swidth=N",  _("Specify the stripe width of the device, overriding probed values"),
 		"sunit=N", _("Specify the stripe unit of the device, overriding probed values"),
 		"align=[0|1]", _("Disable or enable alignment of resource groups"),
+		"format=N", _("Specify the format version number"),
 		NULL, NULL
 	};
 	printf(_("Extended options:\n"));
@@ -118,6 +119,7 @@ struct mkfs_opts {
 	unsigned rgsize;
 	unsigned long sunit;
 	unsigned long swidth;
+	unsigned format;
 	uint64_t fssize;
 	int journals;
 	const char *lockproto;
@@ -137,6 +139,7 @@ struct mkfs_opts {
 	unsigned got_locktable:1;
 	unsigned got_device:1;
 	unsigned got_topol:1;
+	unsigned got_format:1;
 
 	unsigned override:1;
 	unsigned quiet:1;
@@ -158,6 +161,7 @@ static void opts_init(struct mkfs_opts *opts)
 	opts->locktable = "";
 	opts->confirm = 1;
 	opts->align = 1;
+	opts->format = GFS2_FORMAT_FS;
 }
 
 struct gfs2_inum *mkfs_journals = NULL;
@@ -290,6 +294,22 @@ static int parse_topology(struct mkfs_opts *opts, char *str)
 	return 0;
 }
 
+static int parse_format(struct mkfs_opts *opts, char *str)
+{
+	unsigned long ln;
+
+	if (parse_ulong(opts, "format", str, &ln) != 0)
+		return -1;
+
+	if (ln < LGFS2_FS_FORMAT_MIN || ln > LGFS2_FS_FORMAT_MAX) {
+		fprintf(stderr, _("Invalid filesystem format: %s\n"), str);
+		return -1;
+	}
+	opts->format = ln;
+	opts->got_format = 1;
+	return 0;
+}
+
 static int opt_parse_extended(char *str, struct mkfs_opts *opts)
 {
 	char *opt;
@@ -316,6 +336,9 @@ static int opt_parse_extended(char *str, struct mkfs_opts *opts)
 				return -1;
 			opts->got_topol = (opts->dev.logical_sector_size != 0 &&
 	                                   opts->dev.physical_sector_size != 0);
+		} else if (strcmp("format", key) == 0) {
+			if (parse_format(opts, val) != 0)
+				return -1;
 		} else if (strcmp("help", key) == 0) {
 			print_ext_opts();
 			return 1;
@@ -1129,7 +1152,7 @@ int main(int argc, char *argv[])
 
 	if (sbd_init(&sbd, &opts, bsize) != 0)
 		exit(-1);
-	lgfs2_sb_init(&sb, bsize);
+	lgfs2_sb_init(&sb, bsize, opts.format);
 	if (opts.debug) {
 		printf(_("File system options:\n"));
 		printf("  bsize = %u\n", sbd.bsize);
@@ -1142,6 +1165,7 @@ int main(int argc, char *argv[])
 		printf("  fssize = %"PRIu64"\n", opts.fssize);
 		printf("  sunit = %lu\n", opts.sunit);
 		printf("  swidth = %lu\n", opts.swidth);
+		printf("  format = %u\n", opts.format);
 	}
 	rgs = rgs_init(&opts, &sbd);
 	if (rgs == NULL)
diff --git a/tests/mkfs.at b/tests/mkfs.at
index 73cdfee6..6d6d3bd1 100644
--- a/tests/mkfs.at
+++ b/tests/mkfs.at
@@ -31,6 +31,16 @@ AT_CHECK([$GFS_MKFS -p lock_nolock -c 0 $GFS_TGT], 255, [ignore], [ignore])
 AT_CHECK([$GFS_MKFS -p lock_nolock -c 65 $GFS_TGT], 255, [ignore], [ignore])
 AT_CLEANUP
 
+AT_SETUP([Format version validation])
+AT_KEYWORDS(mkfs.gfs2 mkfs)
+AT_CHECK([$GFS_MKFS -p lock_nolock -o format=-1 $GFS_TGT], 255, [ignore], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -o format=0 $GFS_TGT], 255, [ignore], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -o format=1800 $GFS_TGT], 255, [ignore], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -o format=1801 $GFS_TGT], 0, [ignore], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -o format=1802 $GFS_TGT], 0, [ignore], [ignore])
+AT_CHECK([$GFS_MKFS -p lock_nolock -o format=1803 $GFS_TGT], 255, [ignore], [ignore])
+AT_CLEANUP
+
 AT_SETUP([Locking protocols])
 AT_KEYWORDS(mkfs.gfs2 mkfs)
 GFS_FSCK_CHECK([$GFS_MKFS -p lock_nolock $GFS_TGT])
-- 
2.29.2

