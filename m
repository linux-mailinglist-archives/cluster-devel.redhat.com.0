Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B3770B02
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Aug 2023 23:32:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691184763;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/6uD9P+MNfwKoMtFQjp8y/Prw7N6snYRHghi9zMz1dA=;
	b=gewGBae7f4USYWpQuWBBDr/cFxVDCtFN8IuHtLsaCwYhY4dFowQhaVQCzXBXV1SqyTfXHK
	L3dTF+UWE2WHOOAvuzY2ZH7yCxGVL6/4s9Ej2MmG60vsJlqPUloVoxbTJY5dZj6AMeDyCg
	i2cBvKIuI5XcAsDf4jyhM7TVxwe19bI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-rMfCYqfQNyGdUEEdhu31SA-1; Fri, 04 Aug 2023 17:32:40 -0400
X-MC-Unique: rMfCYqfQNyGdUEEdhu31SA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D215028237C3;
	Fri,  4 Aug 2023 21:32:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C65D140282C;
	Fri,  4 Aug 2023 21:32:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7E1EF1946597;
	Fri,  4 Aug 2023 21:32:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 79573194658D for <cluster-devel@listman.corp.redhat.com>;
 Fri,  4 Aug 2023 21:32:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5A7C940C2070; Fri,  4 Aug 2023 21:32:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.225.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68C1240C2063;
 Fri,  4 Aug 2023 21:32:37 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri,  4 Aug 2023 23:32:36 +0200
Message-Id: <20230804213236.1499047-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH] gfs2: Don't use filemap_splice_read
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Bob Peterson <rpeterso@redhat.com>

Starting with patch 2cb1e08985, gfs2 started using the new function
filemap_splice_read rather than the old (and subsequently deleted)
function generic_file_splice_read.

filemap_splice_read works by taking references to a number of folios in
the page cache and splicing those folios into a pipe.  The folios are
then read from the pipe and the folio references are dropped.  This can
take an arbitrary amount of time.  We cannot allow that in gfs2 because
those folio references will pin the inode glock to the node and prevent
it from being demoted, which can lead to cluster-wide deadlocks.

Instead, use copy_splice_read.

(In addition, the old generic_file_splice_read called into ->read_iter,
which called gfs2_file_read_iter, which took the inode glock during the
operation.  The new filemap_splice_read interface does not take the
inode glock anymore.  This is fixable, but it still wouldn't prevent
cluster-wide deadlocks.)

Fixes: 2cb1e08985e3 ("splice: Use filemap_splice_read() instead of generic_file_splice_read()")
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 1bf3c4453516..b43fa8b8fc05 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1578,7 +1578,7 @@ const struct file_operations gfs2_file_fops = {
 	.fsync		= gfs2_fsync,
 	.lock		= gfs2_lock,
 	.flock		= gfs2_flock,
-	.splice_read	= filemap_splice_read,
+	.splice_read	= copy_splice_read,
 	.splice_write	= gfs2_file_splice_write,
 	.setlease	= simple_nosetlease,
 	.fallocate	= gfs2_fallocate,
@@ -1609,7 +1609,7 @@ const struct file_operations gfs2_file_fops_nolock = {
 	.open		= gfs2_open,
 	.release	= gfs2_release,
 	.fsync		= gfs2_fsync,
-	.splice_read	= filemap_splice_read,
+	.splice_read	= copy_splice_read,
 	.splice_write	= gfs2_file_splice_write,
 	.setlease	= generic_setlease,
 	.fallocate	= gfs2_fallocate,
-- 
2.40.1

