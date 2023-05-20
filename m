Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAF770AA08
	for <lists+cluster-devel@lfdr.de>; Sat, 20 May 2023 20:23:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684607029;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nQMWnXTrLfSrzo4ZccLdYtfdpKcq51djJw9oavkPbXQ=;
	b=KDRAnFz5ZEQidvKKute28E69xQsxLnzjlOhySOsY7UQIdodhI83Op3WkbCJvbSxkOCnV8y
	QlHraO46GcrjTxT1QGz4QEFS/EobBm/ULK656GGIM2pMdruLdaSOVOGn87rncuqZj4WE93
	Eu6EROTMijkbtex2h8KHBwjtpHzYMNY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-eJXw4KdgODSaZAhRwp68gg-1; Sat, 20 May 2023 14:23:45 -0400
X-MC-Unique: eJXw4KdgODSaZAhRwp68gg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F30F0800B35;
	Sat, 20 May 2023 18:23:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0C5B2166B25;
	Sat, 20 May 2023 18:23:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 28B1219465B9;
	Sat, 20 May 2023 18:23:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0F91319465A0 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 20 May 2023 18:23:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 028651121315; Sat, 20 May 2023 18:23:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF10D1121314
 for <cluster-devel@redhat.com>; Sat, 20 May 2023 18:23:39 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D23A9811E78
 for <cluster-devel@redhat.com>; Sat, 20 May 2023 18:23:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-2d96sWCwORODulyO3bNMjQ-1; Sat, 20 May 2023 14:23:36 -0400
X-MC-Unique: 2d96sWCwORODulyO3bNMjQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B017616DA;
 Sat, 20 May 2023 18:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E1EC433D2;
 Sat, 20 May 2023 18:23:33 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat, 20 May 2023 14:23:08 -0400
Message-Id: <20230520182312.851751-4-sashal@kernel.org>
In-Reply-To: <20230520182312.851751-1-sashal@kernel.org>
References: <20230520182312.851751-1-sashal@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH AUTOSEL 5.10 4/8] gfs2: Don't deref jdesc in
 evict
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
 Yang Lan <lanyang0908@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 504a10d9e46bc37b23d0a1ae2f28973c8516e636 ]

On corrupt gfs2 file systems the evict code can try to reference the
journal descriptor structure, jdesc, after it has been freed and set to
NULL. The sequence of events is:

init_journal()
...
fail_jindex:
   gfs2_jindex_free(sdp); <------frees journals, sets jdesc =3D NULL
      if (gfs2_holder_initialized(&ji_gh))
         gfs2_glock_dq_uninit(&ji_gh);
fail:
   iput(sdp->sd_jindex); <--references jdesc in evict_linked_inode
      evict()
         gfs2_evict_inode()
            evict_linked_inode()
               ret =3D gfs2_trans_begin(sdp, 0, sdp->sd_jdesc->jd_blocks);
<------references the now freed/zeroed sd_jdesc pointer.

The call to gfs2_trans_begin is done because the truncate_inode_pages
call can cause gfs2 events that require a transaction, such as removing
journaled data (jdata) blocks from the journal.

This patch fixes the problem by adding a check for sdp->sd_jdesc to
function gfs2_evict_inode. In theory, this should only happen to corrupt
gfs2 file systems, when gfs2 detects the problem, reports it, then tries
to evict all the system inodes it has read in up to that point.

Reported-by: Yang Lan <lanyang0908@gmail.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/super.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 5cb7e771b57ab..e01b6a2d12d30 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1416,6 +1416,14 @@ static void gfs2_evict_inode(struct inode *inode)
 =09if (inode->i_nlink || sb_rdonly(sb))
 =09=09goto out;
=20
+=09/*
+=09 * In case of an incomplete mount, gfs2_evict_inode() may be called for
+=09 * system files without having an active journal to write to.  In that
+=09 * case, skip the filesystem evict.
+=09 */
+=09if (!sdp->sd_jdesc)
+=09=09goto out;
+
 =09gfs2_holder_mark_uninitialized(&gh);
 =09ret =3D evict_should_delete(inode, &gh);
 =09if (ret =3D=3D SHOULD_DEFER_EVICTION)
--=20
2.39.2

