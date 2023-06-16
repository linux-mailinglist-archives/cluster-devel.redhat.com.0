Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDB4732D91
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Jun 2023 12:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686911164;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W5ijUM+VLoY4XwWQE4pl7VfD68SZ1pCv1sw89tbKnJ0=;
	b=QQAbqkIHrCalPNnjCQhsxXM8XktSGUtAlSQLwzvV5e3/cTSD/Ud1tX48F5BHw8jbNlARgm
	nIUDAULITNP5fW+EjPsC6ayQLzBAqZsxmGQ3RNG7Z9bqrB5lwTPLlKECam4VsfheIZh2j6
	Zuu9jwIooC65rFG/v9I+O8E2g2T+a0c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-sOjIK7L_OruAqgKTuLR6bA-1; Fri, 16 Jun 2023 06:26:00 -0400
X-MC-Unique: sOjIK7L_OruAqgKTuLR6bA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 816ED1C03D80;
	Fri, 16 Jun 2023 10:25:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03D1F1121314;
	Fri, 16 Jun 2023 10:25:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 92CE919465B8;
	Fri, 16 Jun 2023 10:25:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 605A71946589 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Jun 2023 10:25:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4FA7EC1604D; Fri, 16 Jun 2023 10:25:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 479CBC1604C
 for <cluster-devel@redhat.com>; Fri, 16 Jun 2023 10:25:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26A5E3C025D8
 for <cluster-devel@redhat.com>; Fri, 16 Jun 2023 10:25:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-zxVink0dNxeoz_9SasC3kw-1; Fri, 16 Jun 2023 06:25:50 -0400
X-MC-Unique: zxVink0dNxeoz_9SasC3kw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A14EF6359F;
 Fri, 16 Jun 2023 10:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A643C433CA;
 Fri, 16 Jun 2023 10:25:48 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 16 Jun 2023 06:25:02 -0400
Message-Id: <20230616102521.673087-14-sashal@kernel.org>
In-Reply-To: <20230616102521.673087-1-sashal@kernel.org>
References: <20230616102521.673087-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.8
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH AUTOSEL 6.3 14/30] gfs2: Don't get stuck
 writing page onto itself under direct I/O
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
 Jan Kara <jack@suse.cz>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Andreas Gruenbacher <agruenba@redhat.com>

[ Upstream commit fa58cc888d67e640e354d8b3ceef877ea167b0cf ]

When a direct I/O write is performed, iomap_dio_rw() invalidates the
part of the page cache which the write is going to before carrying out
the write.  In the odd case, the direct I/O write will be reading from
the same page it is writing to.  gfs2 carries out writes with page
faults disabled, so it should have been obvious that this page
invalidation can cause iomap_dio_rw() to never make any progress.
Currently, gfs2 will end up in an endless retry loop in
gfs2_file_direct_write() instead, though.

Break this endless loop by limiting the number of retries and falling
back to buffered I/O after that.

Also simplify should_fault_in_pages() sightly and add a comment to make
the above case easier to understand.

Reported-by: Jan Kara <jack@suse.cz>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/file.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 300844f50dcd2..cb62c8f07d1e7 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -784,9 +784,13 @@ static inline bool should_fault_in_pages(struct iov_it=
er *i,
 =09if (!user_backed_iter(i))
 =09=09return false;
=20
+=09/*
+=09 * Try to fault in multiple pages initially.  When that doesn't result
+=09 * in any progress, fall back to a single page.
+=09 */
 =09size =3D PAGE_SIZE;
 =09offs =3D offset_in_page(iocb->ki_pos);
-=09if (*prev_count !=3D count || !*window_size) {
+=09if (*prev_count !=3D count) {
 =09=09size_t nr_dirtied;
=20
 =09=09nr_dirtied =3D max(current->nr_dirtied_pause -
@@ -870,6 +874,7 @@ static ssize_t gfs2_file_direct_write(struct kiocb *ioc=
b, struct iov_iter *from,
 =09struct gfs2_inode *ip =3D GFS2_I(inode);
 =09size_t prev_count =3D 0, window_size =3D 0;
 =09size_t written =3D 0;
+=09bool enough_retries;
 =09ssize_t ret;
=20
 =09/*
@@ -913,11 +918,17 @@ static ssize_t gfs2_file_direct_write(struct kiocb *i=
ocb, struct iov_iter *from,
 =09if (ret > 0)
 =09=09written =3D ret;
=20
+=09enough_retries =3D prev_count =3D=3D iov_iter_count(from) &&
+=09=09=09 window_size <=3D PAGE_SIZE;
 =09if (should_fault_in_pages(from, iocb, &prev_count, &window_size)) {
 =09=09gfs2_glock_dq(gh);
 =09=09window_size -=3D fault_in_iov_iter_readable(from, window_size);
-=09=09if (window_size)
-=09=09=09goto retry;
+=09=09if (window_size) {
+=09=09=09if (!enough_retries)
+=09=09=09=09goto retry;
+=09=09=09/* fall back to buffered I/O */
+=09=09=09ret =3D 0;
+=09=09}
 =09}
 out_unlock:
 =09if (gfs2_holder_queued(gh))
--=20
2.39.2

