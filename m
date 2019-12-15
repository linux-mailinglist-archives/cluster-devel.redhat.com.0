Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 670381311B5
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Jan 2020 13:00:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578312048;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kjBbzIAC4Nx4GIt2rpLS/pf0ZH1F3j3p8eVMKeToQUo=;
	b=KGWSP+B+7okQcWFl9OFuJMDYYBH4yRYY8h5kxsNbh0nv3LGzuzzDO0bsnb1UYKuufTdxcE
	IWKHEoOc8uvJBMvIYg8wbxePqNrI+RzfI8c246QrQJr5m9MKpH1PXAMHPAC6uESDpA0+ib
	JQcBhijIGoYahb8eVJNB7ihVw9YRyq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-jQ6skC8NMImdBKFabcoBcw-1; Mon, 06 Jan 2020 07:00:46 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C908802B98;
	Mon,  6 Jan 2020 12:00:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 839FB7C00A;
	Mon,  6 Jan 2020 12:00:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A81081C6D;
	Mon,  6 Jan 2020 12:00:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBFGkUhv032155 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 15 Dec 2019 11:46:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 298122166B2A; Sun, 15 Dec 2019 16:46:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 252EC2166B27
	for <cluster-devel@redhat.com>; Sun, 15 Dec 2019 16:46:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15030800307
	for <cluster-devel@redhat.com>; Sun, 15 Dec 2019 16:46:28 +0000 (UTC)
Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-233-uR9CayinMOC9d3ARlvSiRw-1; Sun, 15 Dec 2019 11:46:26 -0500
Received: from localhost (unknown [127.0.0.1])
	by mta-p7.oit.umn.edu (Postfix) with ESMTP id 47bVfT6S9Jz9vKSq
	for <cluster-devel@redhat.com>; Sun, 15 Dec 2019 16:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
	by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIHte51UEUFF for <cluster-devel@redhat.com>;
	Sun, 15 Dec 2019 10:46:25 -0600 (CST)
Received: from mail-yw1-f71.google.com (mail-yw1-f71.google.com
	[209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 47bVfT5J56z9vs7F
	for <cluster-devel@redhat.com>; Sun, 15 Dec 2019 10:46:25 -0600 (CST)
Received: by mail-yw1-f71.google.com with SMTP id o1so1676789ywl.1
	for <cluster-devel@redhat.com>; Sun, 15 Dec 2019 08:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qe+Uav0n6Sb4lk25AgUnese0gA+AsOsF8bWtX8C1yxg=;
	b=f5xlvQZQI+muAo4wWUAklU0ObcYB5F1s9WlQUqgx7N7RbQttiFA09+5Vh373fN7EqB
	n133QqdFgVDjPALN0hcc6S9AnU7CTxNtbz9a9UAJoVIMcOPJRxcPZzTZpE1TGTPmAbjL
	lyZ8W2ClIoGQhF8cQG9KKtGLutiR/bpCOtQldUFg09+FnAYxWKS0YgxFWoopy/3iKgiF
	UuPipbgeniE8WhCoH4nyiv7e3W8SJ9Vyrtese8MIUVhV/DbRPh8aizIFfTaDdXZ65EcI
	D3/NX5/BAX8pFacfnFjCJ8M2V00UOX4Zq4Uqowl1i1sSXfiCy8M1JhARn922X7ysTnTn
	ZFUA==
X-Gm-Message-State: APjAAAVjbRdEj7wNXoi6Dom/nqRBPSMapjBnSjhRlcFgWQTHWf8NSHpM
	MJ94sLWbJ3Q7848yiLa4VVSIweHboOkpQMk6ElZs/qgb6IkcavkOUI2tBXKEmdM1r54KcvudXRY
	OSGdOqr8en0maYaugHlIJha0=
X-Received: by 2002:a81:3a0b:: with SMTP id h11mr16718851ywa.217.1576428385132;
	Sun, 15 Dec 2019 08:46:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqz0he0c+V89zl40cSAULuSQ6fzVPtpuzFAtxEGcaiXM5OmacimtBQk2SMZ+2yDZrAXlQvxdkg==
X-Received: by 2002:a81:3a0b:: with SMTP id h11mr16718840ywa.217.1576428384872;
	Sun, 15 Dec 2019 08:46:24 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu.
	[128.101.106.66]) by smtp.gmail.com with ESMTPSA id
	i81sm6961408ywa.103.2019.12.15.08.46.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 08:46:24 -0800 (PST)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Date: Sun, 15 Dec 2019 10:46:21 -0600
Message-Id: <20191215164621.25828-1-pakki001@umn.edu>
MIME-Version: 1.0
X-MC-Unique: uR9CayinMOC9d3ARlvSiRw-1
X-MC-Unique: jQ6skC8NMImdBKFabcoBcw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBFGkUhv032155
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 Jan 2020 07:00:35 -0500
Cc: cluster-devel@redhat.com, kjlu@umn.edu, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: remove assertion when journal_info is
	not empty
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

In gfs2_trans_begin, avoid crashing when current->journal_info
is not empty. The patch fixes  the error by returning -EINVAL
instead of crashing.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 fs/gfs2/trans.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 9d4227330de4..cef8816ae0b4 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -31,7 +31,9 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int b=
locks,
 =09struct gfs2_trans *tr;
 =09int error;
=20
-=09BUG_ON(current->journal_info);
+=09if (current->journal_info)
+=09=09return -EINVAL;
+
 =09BUG_ON(blocks =3D=3D 0 && revokes =3D=3D 0);
=20
 =09if (!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
--=20
2.20.1


