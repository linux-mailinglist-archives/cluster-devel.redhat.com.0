Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF746C9CE3
	for <lists+cluster-devel@lfdr.de>; Mon, 27 Mar 2023 09:55:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679903727;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DckfJdZQH+X8twF/2MU5JlX75nTIr4ob3ZQUWwE0T6g=;
	b=Jfkfc3Az82ZZI81CJn99TqU97WvXatMfZ3fP72Dq2+XhCDjrMSaZ0vvZiwmZRvyL8rXmUI
	0FdTdxjLsRykeOo7A0ENy+S+GznOWeyC5n0rWRG3V2S3NhTG8DhrmV87ZFlC1o37dpLt7L
	IDuJrvDeM9tmC6cXUeY1Q6YAQluTJ+4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-kY2k3xHuPwSKBrWOvT-ypQ-1; Mon, 27 Mar 2023 03:55:25 -0400
X-MC-Unique: kY2k3xHuPwSKBrWOvT-ypQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 746A82A59572;
	Mon, 27 Mar 2023 07:55:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A9554020C82;
	Mon, 27 Mar 2023 07:55:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C8DCB1946A6A;
	Mon, 27 Mar 2023 07:55:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7829B1946A5A for <cluster-devel@listman.corp.redhat.com>;
 Fri, 24 Mar 2023 20:27:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 259B52166B2A; Fri, 24 Mar 2023 20:27:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E4C52166B29
 for <cluster-devel@redhat.com>; Fri, 24 Mar 2023 20:27:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2D45884621
 for <cluster-devel@redhat.com>; Fri, 24 Mar 2023 20:27:01 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232--D-0k5nuMeqIF2XRoRyUrQ-1; Fri, 24 Mar 2023 16:26:58 -0400
X-MC-Unique: -D-0k5nuMeqIF2XRoRyUrQ-1
Received: from fpc.intra.ispras.ru (unknown [10.10.165.3])
 by mail.ispras.ru (Postfix) with ESMTPSA id D7E6940737B7;
 Fri, 24 Mar 2023 20:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru D7E6940737B7
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Date: Fri, 24 Mar 2023 23:26:15 +0300
Message-Id: <20230324202615.330615-1-pchelkin@ispras.ru>
In-Reply-To: <20230324201933.329885-2-pchelkin@ispras.ru>
References: 
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Mon, 27 Mar 2023 07:55:21 +0000
Subject: [Cluster-devel] [PATCH v2 4.19/5.4/5.10 1/1] gfs2: Always check
 inode size of inline inodes
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 Fedor Pchelkin <pchelkin@ispras.ru>, cluster-devel@redhat.com,
 syzbot+7bb81dfa9cda07d9cd9d@syzkaller.appspotmail.com,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: ispras.ru
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Andreas Gruenbacher <agruenba@redhat.com>

commit 70376c7ff31221f1d21db5611d8209e677781d3a upstream.

Check if the inode size of stuffed (inline) inodes is within the allowed
range when reading inodes from disk (gfs2_dinode_in()).  This prevents
us from on-disk corruption.

The two checks in stuffed_readpage() and gfs2_unstuffer_page() that just
truncate inline data to the maximum allowed size don't actually make
sense, and they can be removed now as well.

Reported-by: syzbot+7bb81dfa9cda07d9cd9d@syzkaller.appspotmail.com
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
[pchelkin@ispras.ru: adjust the inode variable inside gfs2_dinode_in with
the format used before upstream commit 7db354444ad8 ("gfs2: Cosmetic
gfs2_dinode_{in,out} cleanup")]
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
v2: add missed From: tag

 fs/gfs2/aops.c  | 2 --
 fs/gfs2/bmap.c  | 3 ---
 fs/gfs2/glops.c | 3 +++
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 530659554870..a0430da033b3 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -451,8 +451,6 @@ static int stuffed_readpage(struct gfs2_inode *ip, stru=
ct page *page)
 =09=09return error;
=20
 =09kaddr =3D kmap_atomic(page);
-=09if (dsize > gfs2_max_stuffed_size(ip))
-=09=09dsize =3D gfs2_max_stuffed_size(ip);
 =09memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode), dsize);
 =09memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
 =09kunmap_atomic(kaddr);
diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index b4fde3a8eeb4..eaee95d2ad14 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -69,9 +69,6 @@ static int gfs2_unstuffer_page(struct gfs2_inode *ip, str=
uct buffer_head *dibh,
 =09=09void *kaddr =3D kmap(page);
 =09=09u64 dsize =3D i_size_read(inode);
 =20
-=09=09if (dsize > gfs2_max_stuffed_size(ip))
-=09=09=09dsize =3D gfs2_max_stuffed_size(ip);
-
 =09=09memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode), dsize);
 =09=09memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
 =09=09kunmap(page);
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index bf539eab92c6..db28c240dae3 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -454,6 +454,9 @@ static int gfs2_dinode_in(struct gfs2_inode *ip, const =
void *buf)
 =09ip->i_depth =3D (u8)depth;
 =09ip->i_entries =3D be32_to_cpu(str->di_entries);
=20
+=09if (gfs2_is_stuffed(ip) && ip->i_inode.i_size > gfs2_max_stuffed_size(i=
p))
+=09=09goto corrupt;
+
 =09if (S_ISREG(ip->i_inode.i_mode))
 =09=09gfs2_set_aops(&ip->i_inode);
=20
--=20
2.34.1

