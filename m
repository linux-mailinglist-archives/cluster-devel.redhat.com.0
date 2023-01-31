Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E6B6830E1
	for <lists+cluster-devel@lfdr.de>; Tue, 31 Jan 2023 16:07:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675177645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gUqUPrA9IwKrNUdfk0iGM9kpt9kYBxov1otiW6x+sgo=;
	b=BJd+CLLExujOM4k/ocIbmWzPWbGAOw7H1vOocBbtFhlMiZFSe5zsALYRIKeePOY2OnHcdy
	uZiU9V9wFFOIJmaCl/NESWMyIOMc/nKapboVyW67dhCRG/7zAEIC4uUjLaP/leUzS6Pmpf
	chzi76D0m5LT4N1QFkz1yPl6IM6n0gc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-Oa7y7Ad8O6uTfYSmolawhw-1; Tue, 31 Jan 2023 10:07:20 -0500
X-MC-Unique: Oa7y7Ad8O6uTfYSmolawhw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 214C1293248E;
	Tue, 31 Jan 2023 15:07:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAD182026D4B;
	Tue, 31 Jan 2023 15:07:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A40181946594;
	Tue, 31 Jan 2023 15:07:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DB62C1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 31 Jan 2023 15:07:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0F665492B00; Tue, 31 Jan 2023 15:07:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08557492C3E
 for <cluster-devel@redhat.com>; Tue, 31 Jan 2023 15:07:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2A46800B23
 for <cluster-devel@redhat.com>; Tue, 31 Jan 2023 15:07:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-gngOBRELNImG-xo3YHsBpg-1; Tue, 31 Jan 2023 10:07:09 -0500
X-MC-Unique: gngOBRELNImG-xo3YHsBpg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0970861564;
 Tue, 31 Jan 2023 15:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17405C4339C;
 Tue, 31 Jan 2023 15:00:07 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 31 Jan 2023 09:59:36 -0500
Message-Id: <20230131145946.1249850-10-sashal@kernel.org>
In-Reply-To: <20230131145946.1249850-1-sashal@kernel.org>
References: <20230131145946.1249850-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH AUTOSEL 6.1 10/20] Revert "gfs2: stop using
 generic_writepages in gfs2_ail1_start_one"
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
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Andreas Gruenbacher <agruenba@redhat.com>

[ Upstream commit 95ecbd0f162fc06ef4c4045a66f653f47b62a2d3 ]

Commit b2b0a5e97855 switched from generic_writepages() to
filemap_fdatawrite_wbc() in gfs2_ail1_start_one() on the path to
replacing ->writepage() with ->writepages() and eventually eliminating
the former.  Function gfs2_ail1_start_one() is called from
gfs2_log_flush(), our main function for flushing the filesystem log.

Unfortunately, at least as implemented today, ->writepage() and
->writepages() are entirely different operations for journaled data
inodes: while the former creates and submits transactions covering the
data to be written, the latter flushes dirty buffers out to disk.

With gfs2_ail1_start_one() now calling ->writepages(), we end up
creating filesystem transactions while we are in the course of a log
flush, which immediately deadlocks on the sdp->sd_log_flush_lock
semaphore.

Work around that by going back to how things used to work before commit
b2b0a5e97855 for now; figuring out a superior solution will take time we
don't have available right now.  However ...

Since the removal of generic_writepages() is imminent, open-code it
here.  We're already inside a blk_start_plug() ...  blk_finish_plug()
section here, so skip that part of the original generic_writepages().

This reverts commit b2b0a5e978552e348f85ad9c7568b630a5ede659.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Acked-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/log.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 723639376ae2..61323deb80bc 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -80,6 +80,15 @@ void gfs2_remove_from_ail(struct gfs2_bufdata *bd)
 =09brelse(bd->bd_bh);
 }
=20
+static int __gfs2_writepage(struct page *page, struct writeback_control *w=
bc,
+=09=09       void *data)
+{
+=09struct address_space *mapping =3D data;
+=09int ret =3D mapping->a_ops->writepage(page, wbc);
+=09mapping_set_error(mapping, ret);
+=09return ret;
+}
+
 /**
  * gfs2_ail1_start_one - Start I/O on a transaction
  * @sdp: The superblock
@@ -131,7 +140,7 @@ __acquires(&sdp->sd_ail_lock)
 =09=09if (!mapping)
 =09=09=09continue;
 =09=09spin_unlock(&sdp->sd_ail_lock);
-=09=09ret =3D filemap_fdatawrite_wbc(mapping, wbc);
+=09=09ret =3D write_cache_pages(mapping, wbc, __gfs2_writepage, mapping);
 =09=09if (need_resched()) {
 =09=09=09blk_finish_plug(plug);
 =09=09=09cond_resched();
--=20
2.39.0

