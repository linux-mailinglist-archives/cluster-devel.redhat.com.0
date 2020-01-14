Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3421413AF9C
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 17:40:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579020036;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YjFw8F1ynWSWly0gpjTe2VSvLgSELBpUMW33aM0LCNI=;
	b=QCWbIuI+/sfxzE/T/kTa5AhbEPdwNffxke0NS5FqjarNw33XYm1bhVDmzcOnUJncWqWgex
	qEahGOS+xxeJ5llB+6/SwuUYYQYci67jZo/aqIN5XlhsnpPtJty38B9rVOaaKqpceo1onS
	Dopwdid2+gqXugFxJ6wjsdkX4ytwGWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-L0zlXsVaPVyv6g27TK43TA-1; Tue, 14 Jan 2020 11:40:34 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 926CA8DACDC;
	Tue, 14 Jan 2020 16:40:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B35C84778;
	Tue, 14 Jan 2020 16:40:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF19A82514;
	Tue, 14 Jan 2020 16:40:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EGeS3d021498 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 11:40:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 70A4B10AF420; Tue, 14 Jan 2020 16:40:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BA6110AF41D
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 742D110192A9
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-70-JiEm2nAMPkaxPY3b1WqPpw-1; Tue, 14 Jan 2020 11:40:24 -0500
Received: from [2001:4bb8:18c:4f54:fcbb:a92b:61e1:719] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irOoL-0000FW-71; Tue, 14 Jan 2020 16:12:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org, 
	cluster-devel@redhat.com
Date: Tue, 14 Jan 2020 17:12:24 +0100
Message-Id: <20200114161225.309792-12-hch@lst.de>
In-Reply-To: <20200114161225.309792-1-hch@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: JiEm2nAMPkaxPY3b1WqPpw-1
X-MC-Unique: L0zlXsVaPVyv6g27TK43TA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EGeS3d021498
X-loop: cluster-devel@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 11/12] xfs: don't set IOMAP_DIO_SYNCHRONOUS
	for unaligned I/O
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Now that i_rwsem is held until asynchronous writes complete, there
is no need to force them to execute synchronously, as the i_rwsem
protection is exactly the same as for synchronous writes.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/xfs/xfs_file.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index d0ee7d2932e4..3a734ad4bb10 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -510,9 +510,6 @@ xfs_file_dio_aio_write(
 =09}
=20
 =09if (iocb->ki_flags & IOCB_NOWAIT) {
-=09=09/* unaligned dio always waits, bail */
-=09=09if (unaligned_io)
-=09=09=09return -EAGAIN;
 =09=09if (!xfs_ilock_nowait(ip, iolock))
 =09=09=09return -EAGAIN;
 =09} else {
@@ -526,14 +523,11 @@ xfs_file_dio_aio_write(
=20
 =09/*
 =09 * If we are doing unaligned I/O, we can't allow any other overlapping
-=09 * I/O in-flight at the same time or we risk data corruption.  Wait for
-=09 * all other I/O to drain before we submit and execute the I/O
-=09 * synchronously to prevent subsequent overlapping I/O.  If the I/O is
-=09 * aligned, demote the iolock if we had to take the exclusive lock in
-=09 * xfs_file_aio_write_checks() for other reasons.
+=09 * If the I/O is aligned, demote the iolock if we had to take the
+=09 * exclusive lock in xfs_file_aio_write_checks() for other reasons.
 =09 */
 =09if (unaligned_io) {
-=09=09dio_flags =3D IOMAP_DIO_RWSEM_EXCL | IOMAP_DIO_SYNCHRONOUS;
+=09=09dio_flags =3D IOMAP_DIO_RWSEM_EXCL;
 =09} else {
 =09=09if (iolock =3D=3D XFS_IOLOCK_EXCL) {
 =09=09=09xfs_ilock_demote(ip, XFS_IOLOCK_EXCL);
--=20
2.24.1


