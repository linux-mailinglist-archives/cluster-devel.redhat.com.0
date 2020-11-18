Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C106E2B808C
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Nov 2020 16:31:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605713501;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cB4Mge5NREFIS1aJO86eI5Nl3r9o4hTFW6n9W4AYcf4=;
	b=HYKwSozmdpFMKnDO6wty8+73q4vLECgdWo3kuWmjaZT6ku9vKY3p6aTggnzNZxWlttGcou
	Ha2Qmj3AyEjjEJ5OUUjKBZN6yw/8KnzdM+CydUmv6XJPDkFJ9Cb3p4LSA0FdBdaL1wEPxW
	t/hQyxcsO4dSn6zVDIwAq4vnpNmyaVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-nl6_3POmMj2FDnNzZxFI0g-1; Wed, 18 Nov 2020 10:31:37 -0500
X-MC-Unique: nl6_3POmMj2FDnNzZxFI0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCE04804768;
	Wed, 18 Nov 2020 15:31:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47BDF5D9FC;
	Wed, 18 Nov 2020 15:31:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E5DB8C7A1;
	Wed, 18 Nov 2020 15:31:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AIFVSeb021736 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 18 Nov 2020 10:31:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 21E98100AE2D; Wed, 18 Nov 2020 15:31:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.240])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 515CF100AE2C
	for <cluster-devel@redhat.com>; Wed, 18 Nov 2020 15:31:23 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 18 Nov 2020 15:31:20 +0000
Message-Id: <20201118153120.896318-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] MAINTAINERS: Add gfs2 bug tracker link
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

And remove the obsolete website URL.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5cc595ac7b28..eb36a8a9596b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7422,7 +7422,7 @@ M:	Bob Peterson <rpeterso@redhat.com>
 M:	Andreas Gruenbacher <agruenba@redhat.com>
 L:	cluster-devel@redhat.com
 S:	Supported
-W:	http://sources.redhat.com/cluster/
+B:	https://bugzilla.kernel.org/enter_bug.cgi?product=File%20System&component=gfs2
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
 F:	Documentation/filesystems/gfs2*
 F:	fs/gfs2/
-- 
2.28.0

