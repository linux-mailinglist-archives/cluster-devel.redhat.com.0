Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 220214F6FAB
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Apr 2022 03:12:16 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-CoLLoD9-MOK2-xlZMPi7xg-1; Wed, 06 Apr 2022 21:12:12 -0400
X-MC-Unique: CoLLoD9-MOK2-xlZMPi7xg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F87C101AA44;
	Thu,  7 Apr 2022 01:12:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4341E2026E03;
	Thu,  7 Apr 2022 01:12:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 011F0194034E;
	Thu,  7 Apr 2022 01:12:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A99FF1949763 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 01:12:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 842ACC28105; Thu,  7 Apr 2022 01:12:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8087FC28102
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 01:12:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68BE33C14CCC
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 01:12:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-EWO2UYzaNEKiZywHOK7d5g-1; Wed, 06 Apr 2022 21:12:05 -0400
X-MC-Unique: EWO2UYzaNEKiZywHOK7d5g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 174D061DB6;
 Thu,  7 Apr 2022 01:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B80C385AA;
 Thu,  7 Apr 2022 01:12:03 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  6 Apr 2022 21:11:22 -0400
Message-Id: <20220407011140.113856-12-sashal@kernel.org>
In-Reply-To: <20220407011140.113856-1-sashal@kernel.org>
References: <20220407011140.113856-1-sashal@kernel.org>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Cluster-devel] [PATCH AUTOSEL 5.16 12/30] gfs2: Disable page
 faults during lockless buffered reads
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
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: application/octet-stream; x-default=true

From: Andreas Gruenbacher <agruenba@redhat.com>

[ Upstream commit 52f3f033a5dbd023307520af1ff551cadfd7f037 ]

During lockless buffered reads, filemap_read() holds page cache page
references while trying to copy data to the user-space buffer.  The
calling process isn't holding the inode glock, but the page references
it holds prevent those pages from being removed from the page cache, and
that prevents the underlying inode glock from being moved to another
node.  Thus, we can end up in the same kinds of distributed deadlock
situations as with normal (non-lockless) buffered reads.

Fix that by disabling page faults during lockless reads as well.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/file.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 8c39a8571b1f..79741d05e562 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -956,14 +956,16 @@ static ssize_t gfs2_file_read_iter(struct kiocb *iocb=
, struct iov_iter *to)
 =09=09=09return ret;
 =09=09iocb->ki_flags &=3D ~IOCB_DIRECT;
 =09}
+=09pagefault_disable();
 =09iocb->ki_flags |=3D IOCB_NOIO;
 =09ret =3D generic_file_read_iter(iocb, to);
 =09iocb->ki_flags &=3D ~IOCB_NOIO;
+=09pagefault_enable();
 =09if (ret >=3D 0) {
 =09=09if (!iov_iter_count(to))
 =09=09=09return ret;
 =09=09written =3D ret;
-=09} else {
+=09} else if (ret !=3D -EFAULT) {
 =09=09if (ret !=3D -EAGAIN)
 =09=09=09return ret;
 =09=09if (iocb->ki_flags & IOCB_NOWAIT)
--=20
2.35.1

