Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0632413AFA3
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jan 2020 17:40:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579020054;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pldnXQ9SA8wegTY/F/t920bsGE7uveOj0CpqIKNwKpQ=;
	b=IkhvESjJyaZitnBBtee9XLCvY+hxfZNC25677OElgE5dvqJ1zcWkyBGz4fe5j1EzqypYoP
	AoLFs0LAECK2DzG0QS3OsU9Jexd8GbFkcuGnKsw1tDEpRUWSzMN7ReJrfmna8JxiB5Az6t
	bgY736PTCRp2fpRnkPTJu3HEu6NRAKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-mPEXENlqOD6K-aYf1bFiAw-1; Tue, 14 Jan 2020 11:40:53 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64E8C8FB188;
	Tue, 14 Jan 2020 16:40:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E9E365F40;
	Tue, 14 Jan 2020 16:40:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 236C518089D0;
	Tue, 14 Jan 2020 16:40:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EGenNL021558 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 11:40:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E4EBC215AB05; Tue, 14 Jan 2020 16:40:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF9702026D67
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF85F10192A4
	for <cluster-devel@redhat.com>; Tue, 14 Jan 2020 16:40:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-411-rVN115iSMz6qg8PCEVlPsQ-1; Tue, 14 Jan 2020 11:40:46 -0500
Received: from [2001:4bb8:18c:4f54:fcbb:a92b:61e1:719] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irOoF-0000E6-P5; Tue, 14 Jan 2020 16:12:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org, 
	cluster-devel@redhat.com
Date: Tue, 14 Jan 2020 17:12:22 +0100
Message-Id: <20200114161225.309792-10-hch@lst.de>
In-Reply-To: <20200114161225.309792-1-hch@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: rVN115iSMz6qg8PCEVlPsQ-1
X-MC-Unique: mPEXENlqOD6K-aYf1bFiAw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EGenNL021558
X-loop: cluster-devel@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 09/12] gfs2: hold i_rwsem until AIO completes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Switch gfs from the magic i_dio_count scheme to just hold i_rwsem
until the actual I/O has completed to reduce the locking complexity
and avoid nasty bugs due to missing inode_dio_wait calls.

Note that gfs only uses i_rwsem for direct I/O writes, not for
reads so no change to the read behavior.  It might also make sense
to use the same scheme for the gfs2 internal cluster lock.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/bmap.c  |  2 --
 fs/gfs2/file.c  |  6 ++++--
 fs/gfs2/glops.c | 10 ++--------
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 08f6fbb3655e..226f4eb680c7 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -2181,8 +2181,6 @@ int gfs2_setattr_size(struct inode *inode, u64 newsiz=
e)
 =09if (ret)
 =09=09return ret;
=20
-=09inode_dio_wait(inode);
-
 =09ret =3D gfs2_rsqa_alloc(ip);
 =09if (ret)
 =09=09goto out;
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 2260cb5d31af..82a2f313a3e6 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -806,7 +806,8 @@ static ssize_t gfs2_file_direct_write(struct kiocb *ioc=
b, struct iov_iter *from)
 =09if (offset + len > i_size_read(&ip->i_inode))
 =09=09goto out;
=20
-=09ret =3D iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL, 0);
+=09ret =3D iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
+=09=09=09   IOMAP_DIO_RWSEM_EXCL);
=20
 out:
 =09gfs2_glock_dq(&gh);
@@ -923,7 +924,8 @@ static ssize_t gfs2_file_write_iter(struct kiocb *iocb,=
 struct iov_iter *from)
 =09return generic_write_sync(iocb, ret);
=20
 out_unlock:
-=09inode_unlock(inode);
+=09if (ret !=3D -EIOCBQUEUED)
+=09=09inode_unlock(inode);
 =09return ret;
 }
=20
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 4ede1f18de85..a705eeb75117 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -243,11 +243,8 @@ static void inode_go_sync(struct gfs2_glock *gl)
 =09struct address_space *metamapping =3D gfs2_glock2aspace(gl);
 =09int error;
=20
-=09if (isreg) {
-=09=09if (test_and_clear_bit(GIF_SW_PAGED, &ip->i_flags))
-=09=09=09unmap_shared_mapping_range(ip->i_inode.i_mapping, 0, 0);
-=09=09inode_dio_wait(&ip->i_inode);
-=09}
+=09if (isreg && test_and_clear_bit(GIF_SW_PAGED, &ip->i_flags))
+=09=09unmap_shared_mapping_range(ip->i_inode.i_mapping, 0, 0);
 =09if (!test_and_clear_bit(GLF_DIRTY, &gl->gl_flags))
 =09=09goto out;
=20
@@ -440,9 +437,6 @@ static int inode_go_lock(struct gfs2_holder *gh)
 =09=09=09return error;
 =09}
=20
-=09if (gh->gh_state !=3D LM_ST_DEFERRED)
-=09=09inode_dio_wait(&ip->i_inode);
-
 =09if ((ip->i_diskflags & GFS2_DIF_TRUNC_IN_PROG) &&
 =09    (gl->gl_state =3D=3D LM_ST_EXCLUSIVE) &&
 =09    (gh->gh_state =3D=3D LM_ST_EXCLUSIVE)) {
--=20
2.24.1


