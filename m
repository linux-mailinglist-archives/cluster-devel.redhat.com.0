Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 86BC41667B6
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 20:57:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582228624;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8l0K/+n8xfVljzKnaFFf/kLA+7BRGsFb74nCSiLRACA=;
	b=gkVotYmcghJyDBus0hGu/ejPMwmaqlP0/MF7WrrzX4BcehTOyifqekbTRifd3nUjDA/HvQ
	oH7bOu1FhWK0g9WFc3oe4zUdXbS33aLvGrP/A+MOUtfVBdtfF/eKnrixQ5JhksuVLWcA3M
	ndy79XRS3PYWc71JqF1yyn/EVlNAOKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-qDMYYrGDMZaBnXF5wjL2qw-1; Thu, 20 Feb 2020 14:57:02 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9F14800D55;
	Thu, 20 Feb 2020 19:56:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D870C26FBF;
	Thu, 20 Feb 2020 19:56:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B937318089CD;
	Thu, 20 Feb 2020 19:56:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KJscn7009406 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 14:54:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4DD1F90F57; Thu, 20 Feb 2020 19:54:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 69D5290F79
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 19:54:37 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 20 Feb 2020 13:53:27 -0600
Message-Id: <20200220195329.952027-27-rpeterso@redhat.com>
In-Reply-To: <20200220195329.952027-1-rpeterso@redhat.com>
References: <20200220195329.952027-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 26/28] fs: clean up __block_commit_write
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
X-MC-Unique: qDMYYrGDMZaBnXF5wjL2qw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Function __block_commit_write did nothing with the inode passed in
and it always returned 0. This patch changes it to a void and gets
rid of the overhead needed to pass in the inode.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 fs/buffer.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index b8d28370cfd7..07e0a327be4a 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2059,8 +2059,7 @@ int __block_write_begin(struct page *page, loff_t pos=
, unsigned len,
 }
 EXPORT_SYMBOL(__block_write_begin);
=20
-static int __block_commit_write(struct inode *inode, struct page *page,
-=09=09unsigned from, unsigned to)
+static void __block_commit_write(struct page *page, unsigned from, unsigne=
d to)
 {
 =09unsigned block_start, block_end;
 =09int partial =3D 0;
@@ -2094,7 +2093,6 @@ static int __block_commit_write(struct inode *inode, =
struct page *page,
 =09 */
 =09if (!partial)
 =09=09SetPageUptodate(page);
-=09return 0;
 }
=20
 /*
@@ -2130,7 +2128,6 @@ int block_write_end(struct file *file, struct address=
_space *mapping,
 =09=09=09loff_t pos, unsigned len, unsigned copied,
 =09=09=09struct page *page, void *fsdata)
 {
-=09struct inode *inode =3D mapping->host;
 =09unsigned start;
=20
 =09start =3D pos & (PAGE_SIZE - 1);
@@ -2156,7 +2153,7 @@ int block_write_end(struct file *file, struct address=
_space *mapping,
 =09flush_dcache_page(page);
=20
 =09/* This could be a short (even 0-length) commit */
-=09__block_commit_write(inode, page, start, start+copied);
+=09__block_commit_write(page, start, start + copied);
=20
 =09return copied;
 }
@@ -2469,8 +2466,7 @@ EXPORT_SYMBOL(cont_write_begin);
=20
 int block_commit_write(struct page *page, unsigned from, unsigned to)
 {
-=09struct inode *inode =3D page->mapping->host;
-=09__block_commit_write(inode,page,from,to);
+=09__block_commit_write(page, from, to);
 =09return 0;
 }
 EXPORT_SYMBOL(block_commit_write);
--=20
2.24.1

