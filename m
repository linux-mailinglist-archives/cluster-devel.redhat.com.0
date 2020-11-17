Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0C69D2B5F72
	for <lists+cluster-devel@lfdr.de>; Tue, 17 Nov 2020 13:57:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-cnVya2OHPtCtFA7DheZaVA-1; Tue, 17 Nov 2020 07:57:41 -0500
X-MC-Unique: cnVya2OHPtCtFA7DheZaVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93EF510074CC;
	Tue, 17 Nov 2020 12:57:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B09819930;
	Tue, 17 Nov 2020 12:57:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C8FE58135;
	Tue, 17 Nov 2020 12:57:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AHCvUwR004936 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 17 Nov 2020 07:57:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 708CD2166BA3; Tue, 17 Nov 2020 12:57:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 697562166BA0
	for <cluster-devel@redhat.com>; Tue, 17 Nov 2020 12:57:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 057318582A0
	for <cluster-devel@redhat.com>; Tue, 17 Nov 2020 12:57:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-554-9De07eccOD2dNxkHfzNQhw-1;
	Tue, 17 Nov 2020 07:57:22 -0500
X-MC-Unique: 9De07eccOD2dNxkHfzNQhw-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CD87C24695;
	Tue, 17 Nov 2020 12:57:19 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Tue, 17 Nov 2020 07:56:49 -0500
Message-Id: <20201117125652.599614-18-sashal@kernel.org>
In-Reply-To: <20201117125652.599614-1-sashal@kernel.org>
References: <20201117125652.599614-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AHCvUwR004936
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.9 18/21] gfs2: Fix case in which
	ail writes are done to jdata holes
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 4e79e3f08e576acd51dffb4520037188703238b3 ]

Patch b2a846dbef4e ("gfs2: Ignore journal log writes for jdata holes")
tried (unsuccessfully) to fix a case in which writes were done to jdata
blocks, the blocks are sent to the ail list, then a punch_hole or truncate
operation caused the blocks to be freed. In other words, the ail items
are for jdata holes. Before b2a846dbef4e, the jdata hole caused function
gfs2_block_map to return -EIO, which was eventually interpreted as an
IO error to the journal, and then withdraw.

This patch changes function gfs2_get_block_noalloc, which is only used
for jdata writes, so it returns -ENODATA rather than -EIO, and when
-ENODATA is returned to gfs2_ail1_start_one, the error is ignored.
We can safely ignore it because gfs2_ail1_start_one is only called
when the jdata pages have already been written and truncated, so the
ail1 content no longer applies.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/aops.c | 2 +-
 fs/gfs2/log.c  | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index d4af283fc8886..317a47d49442b 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -77,7 +77,7 @@ static int gfs2_get_block_noalloc(struct inode *inode, sector_t lblock,
 	if (error)
 		return error;
 	if (!buffer_mapped(bh_result))
-		return -EIO;
+		return -ENODATA;
 	return 0;
 }
 
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 93032feb51599..1ceeec0ffb16c 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -132,6 +132,8 @@ __acquires(&sdp->sd_ail_lock)
 		spin_unlock(&sdp->sd_ail_lock);
 		ret = generic_writepages(mapping, wbc);
 		spin_lock(&sdp->sd_ail_lock);
+		if (ret == -ENODATA) /* if a jdata write into a new hole */
+			ret = 0; /* ignore it */
 		if (ret || wbc->nr_to_write <= 0)
 			break;
 		return -EBUSY;
-- 
2.27.0


