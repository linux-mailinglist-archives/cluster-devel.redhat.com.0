Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6E34F146DA1
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:58:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795116;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2osI62MZwSptLWEjWgEKnLMBsKZ7tKoYIC2VQz4NK3o=;
	b=Orhj7UNMFs6Ve7Ep2VRBsTeDa6ZYqrRqCd6Uvm2mO05Dfe+I+DqcVabSRIAm+yqB8kiDUY
	h/6hZyKyy3UztaQ7l+jgX9zwFLOLCAIJjof/WO2VojZyzBmFp363jkZoFhUNdGBU+dldpU
	9QCGWPv5J0zjnuPiOSVPEc45KuE5K3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-qATKjs0LMjOO9uJCBKhIJw-1; Thu, 23 Jan 2020 10:58:35 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9D718010D0;
	Thu, 23 Jan 2020 15:58:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A4E51001DC0;
	Thu, 23 Jan 2020 15:58:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F9D28594B;
	Thu, 23 Jan 2020 15:58:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFuADO012366 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:56:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3A1CE60BE1; Thu, 23 Jan 2020 15:56:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41EEA60C81
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:56:06 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:45 +0000
Message-Id: <20200123155552.1080247-7-anprice@redhat.com>
In-Reply-To: <20200123155552.1080247-1-anprice@redhat.com>
References: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 06/13] restoremeta: Don't seek in
	restore_header()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: qATKjs0LMjOO9uJCBKhIJw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This is the first time we read the file so there's no need to seek to
offset 0. The eventual goal here is to have restoremeta not seek at all
as (de)compression libraries do not support it, or emulate it slowly.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index f77c6bf7..ad0c537d 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -888,7 +888,6 @@ static int read_header(struct metafd *mfd, struct savem=
eta_header *smh)
 =09size_t rs;
 =09struct savemeta_header smh_be =3D {0};
=20
-=09mfd->seek(mfd, 0, SEEK_SET);
 =09rs =3D mfd->read(mfd, &smh_be, sizeof(smh_be));
 =09if (rs =3D=3D -1) {
 =09=09perror("Failed to read savemeta file header");
--=20
2.24.1

