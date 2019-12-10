Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4481184D6
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Dec 2019 11:19:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575973194;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y/w2qhmNAwfkY23Bzoz2XeeZ7eRtN89B7DbfBPq1VRk=;
	b=BVlSGx6Kdm6TlESAGjq3OoG9633k+g0WLdbTMiTOAwgAy4D5KMqrK8xFjPSFa82FZ20L1p
	9JJHToYv9KVhIRqNb9PqQ7bLFXSLee/qsikzWNdPMdVYGYeL4GyWxhphNvkpL+KxVwF35r
	mt/7N0Hv8fIdb2ZHrG4jtvMqrwMn1lM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-i9bQ7M2iO6-j4SJBJ0ImJg-1; Tue, 10 Dec 2019 05:19:53 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA7F38017DF;
	Tue, 10 Dec 2019 10:19:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A8916FDCF;
	Tue, 10 Dec 2019 10:19:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F3B98355C;
	Tue, 10 Dec 2019 10:19:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBAAJjHU010414 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Dec 2019 05:19:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5DF995D70D; Tue, 10 Dec 2019 10:19:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-205-78.brq.redhat.com [10.40.205.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A0CA5D6D4;
	Tue, 10 Dec 2019 10:19:41 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Date: Tue, 10 Dec 2019 11:19:38 +0100
Message-Id: <20191210101938.495-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>
Subject: Re: [Cluster-devel] [PATCH 15/15] gfs2: use iomap for buffered I/O
	in ordered and writeback mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: i9bQ7M2iO6-j4SJBJ0ImJg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Mon, Sep 30, 2019 at 10:49 PM Andreas Gruenbacher <agruenba@redhat.com> =
wrote:
> On Tue, Aug 6, 2019 at 7:30 AM Christoph Hellwig <hch@lst.de> wrote:
> > On Mon, Aug 05, 2019 at 02:27:21PM +0200, Andreas Gruenbacher wrote:
> here are the changes we currently need on top of what you've posted on
> July 1.  [...]

again, thank you for this patch.  After fixing some related bugs around thi=
s
change, it seems I've finally got this to work properly.  Below are the min=
or
changes I needed to make on top of your version.

This requires functions iomap_page_create and iomap_set_range_uptodate to b=
e
exported; i'll post a patch for that sepatately.

The result can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next.=
iomap

Thanks,
Andreas

---
 fs/gfs2/bmap.c | 6 ++++--
 fs/gfs2/file.c | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 168ac5147dd0..fcd2043fc466 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -75,13 +75,12 @@ static int gfs2_unstuffer_page(struct gfs2_inode *ip, s=
truct buffer_head *dibh,
 =09=09memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode), dsize);
 =09=09memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
 =09=09kunmap(page);
-
-=09=09SetPageUptodate(page);
 =09}
=20
 =09if (gfs2_is_jdata(ip)) {
 =09=09struct buffer_head *bh;
=20
+=09=09SetPageUptodate(page);
 =09=09if (!page_has_buffers(page))
 =09=09=09create_empty_buffers(page, BIT(inode->i_blkbits),
 =09=09=09=09=09     BIT(BH_Uptodate));
@@ -93,6 +92,9 @@ static int gfs2_unstuffer_page(struct gfs2_inode *ip, str=
uct buffer_head *dibh,
 =09=09set_buffer_uptodate(bh);
 =09=09gfs2_trans_add_data(ip->i_gl, bh);
 =09} else {
+=09=09iomap_page_create(inode, page);
+=09=09iomap_set_range_uptodate(page, 0, i_blocksize(inode));
+=09=09set_page_dirty(page);
 =09=09gfs2_ordered_add_inode(ip);
 =09}
=20
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 9d58295ccf7a..9af352ebc904 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -555,6 +555,8 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vm=
f)
 out_uninit:
 =09gfs2_holder_uninit(&gh);
 =09if (ret =3D=3D 0) {
+=09=09if (!gfs2_is_jdata(ip))
+=09=09=09iomap_page_create(inode, page);
 =09=09set_page_dirty(page);
 =09=09wait_for_stable_page(page);
 =09}
--=20
2.20.1

