Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 15F16107BB0
	for <lists+cluster-devel@lfdr.de>; Sat, 23 Nov 2019 00:53:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574466833;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rvAGjXKzggaIcjor/eU/2AoEyqgwEZJGtnOKutcJ+6k=;
	b=TRsGIiwvNFWPXPBzTGD++lQSuUd+kC94rcGJAnY+XfawOZ3D+iJ5Wovk1N38j19vygzQlY
	T0Rv9+0vqzDYjq2DGO8hLFEwz7kOOrN0UygjD6tuZjjMF2p1sHOdk0GmR4TTrzUGgpXrKr
	YnMRwImq6PH/tnVgeOJUstlMogjr/I8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-D8VdH4x1OEO8FKf8FPRjBg-1; Fri, 22 Nov 2019 18:53:52 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FE5E184B818;
	Fri, 22 Nov 2019 23:53:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54F8D5D6A0;
	Fri, 22 Nov 2019 23:53:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CFDE4A460;
	Fri, 22 Nov 2019 23:53:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAMNrcfZ000787 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 18:53:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 70E035C1B5; Fri, 22 Nov 2019 23:53:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E21FE5C1BB;
	Fri, 22 Nov 2019 23:53:34 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 23 Nov 2019 00:53:22 +0100
Message-Id: <20191122235324.17245-2-agruenba@redhat.com>
In-Reply-To: <20191122235324.17245-1-agruenba@redhat.com>
References: <20191122235324.17245-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: Steve French <sfrench@samba.org>,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-kernel@vger.kernel.org,
	Ronnie Sahlberg <lsahlber@redhat.com>, cluster-devel@redhat.com,
	linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [Cluster-devel] [RFC PATCH 1/3] fs: Add IOCB_CACHED flag for
	generic_file_read_iter
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
X-MC-Unique: D8VdH4x1OEO8FKf8FPRjBg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Add an IOCB_CACHED flag which indicates to generic_file_read_iter that
it should only look at the page cache, without triggering any filesystem
I/O for the actual request or for readahead.  When filesystem I/O would
be triggered, an error code should be returned instead.

This allows the caller to perform a tentative read out of the page
cache, and to retry the read after taking the necessary steps when the
requested pages are not cached.

When readahead would be triggered, we return -ECANCELED instead of
-EAGAIN.  This allows to distinguish attempted readheads from attempted
reads (with IOCB_NOWAIT).

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 include/linux/fs.h |  1 +
 mm/filemap.c       | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index e0d909d35763..4ca5e2885452 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -314,6 +314,7 @@ enum rw_hint {
 #define IOCB_SYNC=09=09(1 << 5)
 #define IOCB_WRITE=09=09(1 << 6)
 #define IOCB_NOWAIT=09=09(1 << 7)
+#define IOCB_CACHED=09=09(1 << 8)
=20
 struct kiocb {
 =09struct file=09=09*ki_filp;
diff --git a/mm/filemap.c b/mm/filemap.c
index 85b7d087eb45..024ff0b5fcb6 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2046,7 +2046,7 @@ static ssize_t generic_file_buffered_read(struct kioc=
b *iocb,
=20
 =09=09page =3D find_get_page(mapping, index);
 =09=09if (!page) {
-=09=09=09if (iocb->ki_flags & IOCB_NOWAIT)
+=09=09=09if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_CACHED))
 =09=09=09=09goto would_block;
 =09=09=09page_cache_sync_readahead(mapping,
 =09=09=09=09=09ra, filp,
@@ -2056,12 +2056,16 @@ static ssize_t generic_file_buffered_read(struct ki=
ocb *iocb,
 =09=09=09=09goto no_cached_page;
 =09=09}
 =09=09if (PageReadahead(page)) {
+=09=09=09if (iocb->ki_flags & IOCB_CACHED) {
+=09=09=09=09error =3D -ECANCELED;
+=09=09=09=09goto out;
+=09=09=09}
 =09=09=09page_cache_async_readahead(mapping,
 =09=09=09=09=09ra, filp, page,
 =09=09=09=09=09index, last_index - index);
 =09=09}
 =09=09if (!PageUptodate(page)) {
-=09=09=09if (iocb->ki_flags & IOCB_NOWAIT) {
+=09=09=09if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_CACHED)) {
 =09=09=09=09put_page(page);
 =09=09=09=09goto would_block;
 =09=09=09}
@@ -2266,6 +2270,13 @@ static ssize_t generic_file_buffered_read(struct kio=
cb *iocb,
  *
  * This is the "read_iter()" routine for all filesystems
  * that can use the page cache directly.
+ *
+ * In the IOCB_NOWAIT flag in iocb->ki_flags indicates that -EAGAIN should=
 be
+ * returned if completing the request would require I/O; this does not pre=
vent
+ * readahead.  The IOCB_CACHED flag indicates that -EAGAIN should be retur=
ned
+ * as under the IOCB_NOWAIT flag, and that -ECANCELED should be returned w=
hen
+ * readhead would be triggered.
+ *
  * Return:
  * * number of bytes copied, even for partial reads
  * * negative error code if nothing was read
@@ -2286,7 +2297,7 @@ generic_file_read_iter(struct kiocb *iocb, struct iov=
_iter *iter)
 =09=09loff_t size;
=20
 =09=09size =3D i_size_read(inode);
-=09=09if (iocb->ki_flags & IOCB_NOWAIT) {
+=09=09if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_CACHED)) {
 =09=09=09if (filemap_range_has_page(mapping, iocb->ki_pos,
 =09=09=09=09=09=09   iocb->ki_pos + count - 1))
 =09=09=09=09return -EAGAIN;
--=20
2.20.1

