Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 062C623DADA
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721118;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4fHRNRtKU+0PI/MdFm44ZRT+eLTxyd8jpnjhdfbpAAM=;
	b=U2/txQZH3f59rxHx/VPFto/IcCURFMX5MTeJ62ymkDbA728vaOR34K09Evqa+ewHc88Rfq
	GN/o9PNvjV6DmfUSgUepLUoYuGIqAj1Fa2tGoJV/5Kcy7tNPDFF4a827hmjHchtQtrW/aX
	T8YtyM5XR/DiLFtGgP1Q3vPy6gw0vEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-HOtZ5HCsOh-gro8ph-odyA-1; Thu, 06 Aug 2020 09:38:36 -0400
X-MC-Unique: HOtZ5HCsOh-gro8ph-odyA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D30471923766;
	Thu,  6 Aug 2020 13:38:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3A285F9DC;
	Thu,  6 Aug 2020 13:38:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B151D96936;
	Thu,  6 Aug 2020 13:38:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcVwg030790 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C8F460BF1; Thu,  6 Aug 2020 13:38:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDEB96111F
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:27 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:48 +0100
Message-Id: <20200806133807.111280-14-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 13/32] libgfs2: Add a display name field to
	struct lgfs2_metadata
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

.name is used for the name of the struct and we have places that need to
tag blocks with a more descriptive name for users to read, so add a
display name for each block type.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/libgfs2/libgfs2.h |  3 ++-
 gfs2/libgfs2/meta.c    | 30 +++++++++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 7ede1967..5350f3d9 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -146,7 +146,8 @@ struct lgfs2_metadata {
 	const unsigned header:1;
 	const uint32_t mh_type;
 	const uint32_t mh_format;
-	const char *name;
+	const char *name; /* Struct name */
+	const char *display; /* Short name for non-programmers */
 	const struct lgfs2_metafield *fields;
 	const unsigned nfields;
 	const unsigned size;
diff --git a/gfs2/libgfs2/meta.c b/gfs2/libgfs2/meta.c
index 1da74146..5ac808c2 100644
--- a/gfs2/libgfs2/meta.c
+++ b/gfs2/libgfs2/meta.c
@@ -560,6 +560,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_SB,
 		.mh_format = GFS2_FORMAT_SB,
 		.name = "gfs2_sb",
+		.display = "superblock",
 		.fields = gfs2_sb_fields,
 		.nfields = ARRAY_SIZE(gfs2_sb_fields),
 		.size = sizeof(struct gfs2_sb),
@@ -570,13 +571,15 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_SB,
 		.mh_format = GFS_FORMAT_SB,
 		.name = "gfs_sb",
+		.display = "superblock",
 		.fields = gfs_sb_fields,
 		.nfields = ARRAY_SIZE(gfs_sb_fields),
 		.size = sizeof(struct gfs_sb),
 	},
 	[LGFS2_MT_RINDEX] = {
 		.versions = LGFS2_MD_GFS1 | LGFS2_MD_GFS2,
-		.name = "rindex",
+		.name = "gfs2_rindex",
+		.display = "resource group index",
 		.fields = gfs2_rindex_fields,
 		.nfields = ARRAY_SIZE(gfs2_rindex_fields),
 		.size = sizeof(struct gfs2_rindex),
@@ -587,6 +590,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_RG,
 		.mh_format = GFS2_FORMAT_RG,
 		.name = "gfs2_rgrp",
+		.display = "resource group",
 		.fields = gfs2_rgrp_fields,
 		.nfields = ARRAY_SIZE(gfs2_rgrp_fields),
 		.size = sizeof(struct gfs2_rgrp),
@@ -597,6 +601,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_RG,
 		.mh_format = GFS2_FORMAT_RG,
 		.name = "gfs_rgrp",
+		.display = "resource group",
 		.fields = gfs_rgrp_fields,
 		.nfields = ARRAY_SIZE(gfs_rgrp_fields),
 		.size = sizeof(struct gfs_rgrp),
@@ -607,6 +612,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_RB,
 		.mh_format = GFS2_FORMAT_RB,
 		.name = "gfs2_rgrp_bitmap",
+		.display = "allocation bitmap",
 		.fields = gfs2_rgrp_bitmap_fields,
 		.nfields = ARRAY_SIZE(gfs2_rgrp_bitmap_fields),
 		.size = sizeof(struct gfs2_meta_header),
@@ -617,6 +623,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_DI,
 		.mh_format = GFS2_FORMAT_DI,
 		.name = "gfs2_dinode",
+		.display = "inode",
 		.fields = gfs2_dinode_fields,
 		.nfields = ARRAY_SIZE(gfs2_dinode_fields),
 		.size = sizeof(struct gfs2_dinode),
@@ -627,6 +634,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_DI,
 		.mh_format = GFS2_FORMAT_DI,
 		.name = "gfs_dinode",
+		.display = "inode",
 		.fields = gfs_dinode_fields,
 		.nfields = ARRAY_SIZE(gfs_dinode_fields),
 		.size = sizeof(struct gfs_dinode),
@@ -637,6 +645,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_IN,
 		.mh_format = GFS2_FORMAT_IN,
 		.name = "gfs2_indirect",
+		.display = "indirect",
 		.fields = gfs2_indirect_fields,
 		.nfields = ARRAY_SIZE(gfs2_indirect_fields),
 		.size = sizeof(struct gfs2_meta_header),
@@ -647,6 +656,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_IN,
 		.mh_format = GFS2_FORMAT_IN,
 		.name = "gfs_indirect",
+		.display = "indirect",
 		.fields = gfs_indirect_fields,
 		.nfields = ARRAY_SIZE(gfs_indirect_fields),
 		.size = sizeof(struct gfs_indirect),
@@ -657,6 +667,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_LF,
 		.mh_format = GFS2_FORMAT_LF,
 		.name = "gfs2_leaf",
+		.display = "leaf",
 		.fields = gfs2_leaf_fields,
 		.nfields = ARRAY_SIZE(gfs2_leaf_fields),
 		.size = sizeof(struct gfs2_leaf),
@@ -667,6 +678,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_JD,
 		.mh_format = GFS2_FORMAT_JD,
 		.name = "gfs2_jdata",
+		.display = "journal data",
 		.fields = gfs2_jdata_fields,
 		.nfields = ARRAY_SIZE(gfs2_jdata_fields),
 		.size = sizeof(struct gfs2_meta_header),
@@ -677,6 +689,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_LH,
 		.mh_format = GFS2_FORMAT_LH,
 		.name = "gfs2_log_header",
+		.display = "log header",
 		.fields = gfs2_log_header_fields,
 		.nfields = ARRAY_SIZE(gfs2_log_header_fields),
 		.size = sizeof(struct gfs2_log_header),
@@ -687,6 +700,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_LH,
 		.mh_format = GFS2_FORMAT_LH,
 		.name = "gfs_log_header",
+		.display = "log header",
 		.fields = gfs_log_header_fields,
 		.nfields = ARRAY_SIZE(gfs_log_header_fields),
 		.size = sizeof(struct gfs_log_header),
@@ -697,6 +711,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_LD,
 		.mh_format = GFS2_FORMAT_LD,
 		.name = "gfs2_log_desc",
+		.display = "log descriptor",
 		.fields = gfs2_log_desc_fields,
 		.nfields = ARRAY_SIZE(gfs2_log_desc_fields),
 		.size = sizeof(struct gfs2_log_descriptor),
@@ -707,6 +722,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_LD,
 		.mh_format = GFS2_FORMAT_LD,
 		.name = "gfs_log_desc",
+		.display = "log descriptor",
 		.fields = gfs_log_desc_fields,
 		.nfields = ARRAY_SIZE(gfs_log_desc_fields),
 		.size = sizeof(struct gfs_log_descriptor),
@@ -717,6 +733,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_LB,
 		.mh_format = GFS2_FORMAT_LB,
 		.name = "gfs2_log_block",
+		.display = "log",
 		.fields = gfs2_log_block_fields,
 		.nfields = ARRAY_SIZE(gfs2_log_block_fields),
 		.size = sizeof(struct gfs2_meta_header),
@@ -727,6 +744,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_EA,
 		.mh_format = GFS2_FORMAT_EA,
 		.name = "gfs2_ea_attr",
+		.display = "extended attribute",
 		.fields = gfs2_ea_attr_fields,
 		.nfields = ARRAY_SIZE(gfs2_ea_attr_fields),
 		.size = sizeof(struct gfs2_meta_header),
@@ -737,6 +755,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 		.mh_type = GFS2_METATYPE_ED,
 		.mh_format = GFS2_FORMAT_ED,
 		.name = "gfs2_ea_data",
+		.display = "extended attribute data",
 		.fields = gfs2_ea_data_fields,
 		.nfields = ARRAY_SIZE(gfs2_ea_data_fields),
 		.size = sizeof(struct gfs2_meta_header),
@@ -744,6 +763,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 	[LGFS2_MT_GFS2_QUOTA_CHANGE] = {
 		.versions = LGFS2_MD_GFS2,
 		.name = "gfs2_quota_change",
+		.display = "quota change",
 		.fields = gfs2_quota_change_fields,
 		.nfields = ARRAY_SIZE(gfs2_quota_change_fields),
 		.size = sizeof(struct gfs2_quota_change),
@@ -751,6 +771,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 	[LGFS2_MT_DIRENT] = {
 		.versions = LGFS2_MD_GFS1 | LGFS2_MD_GFS2,
 		.name = "gfs2_dirent",
+		.display = "directory entry",
 		.fields = gfs2_dirent_fields,
 		.nfields = ARRAY_SIZE(gfs2_dirent_fields),
 		.size = sizeof(struct gfs2_dirent),
@@ -758,6 +779,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 	[LGFS2_MT_EA_HEADER] = {
 		.versions = LGFS2_MD_GFS1 | LGFS2_MD_GFS2,
 		.name = "gfs2_ea_header",
+		.display = "extended attribute header",
 		.fields = gfs2_ea_header_fields,
 		.nfields = ARRAY_SIZE(gfs2_ea_header_fields),
 		.size = sizeof(struct gfs2_ea_header),
@@ -765,6 +787,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 	[LGFS2_MT_GFS2_INUM_RANGE] = {
 		.versions = LGFS2_MD_GFS2,
 		.name = "gfs2_inum_range",
+		.display = "inum range",
 		.fields = gfs2_inum_range_fields,
 		.nfields = ARRAY_SIZE(gfs2_inum_range_fields),
 		.size = sizeof(struct gfs2_inum_range),
@@ -772,6 +795,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 	[LGFS2_MT_STATFS_CHANGE] = {
 		.versions = LGFS2_MD_GFS1 | LGFS2_MD_GFS2,
 		.name = "gfs2_statfs_change",
+		.display = "statfs change",
 		.fields = gfs2_statfs_change_fields,
 		.nfields = ARRAY_SIZE(gfs2_statfs_change_fields),
 		.size = sizeof(struct gfs2_statfs_change),
@@ -779,6 +803,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 	[LGFS2_MT_GFS_JINDEX] = {
 		.versions = LGFS2_MD_GFS1,
 		.name = "gfs_jindex",
+		.display = "journal index",
 		.fields = gfs_jindex_fields,
 		.nfields = ARRAY_SIZE(gfs_jindex_fields),
 		.size = sizeof(struct gfs_jindex),
@@ -786,6 +811,7 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 	[LGFS2_MT_GFS_BLOCK_TAG] = {
 		.versions = LGFS2_MD_GFS1,
 		.name = "gfs_block_tag",
+		.display = "block tag",
 		.fields = gfs_block_tag_fields,
 		.nfields = ARRAY_SIZE(gfs_block_tag_fields),
 		.size = sizeof(struct gfs_block_tag),
@@ -793,10 +819,12 @@ const struct lgfs2_metadata lgfs2_metadata[] = {
 	[LGFS2_MT_DATA] = {
 		.versions = LGFS2_MD_GFS1 | LGFS2_MD_GFS2,
 		.name = "data",
+		.display = "data",
 	},
 	[LGFS2_MT_FREE] = {
 		.versions = LGFS2_MD_GFS1 | LGFS2_MD_GFS2,
 		.name = "free",
+		.display = "free",
 	},
 };
 
-- 
2.26.2

