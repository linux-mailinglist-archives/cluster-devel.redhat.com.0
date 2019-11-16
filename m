Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CAF07FEEA6
	for <lists+cluster-devel@lfdr.de>; Sat, 16 Nov 2019 16:53:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573919613;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YrtojKJ9q9a5UkbY57UFL3UxDV4uff7gjJ7UW9soYpU=;
	b=LqMUuDK+zJ1v+ZsvCWp8PilSwUjvwi9Mm/fxHs7BVhUruDK//ODNl9CmkTNpNYNBXCA2Pa
	dsw0cyAY9eYSrx/SENrWkef2f/oH+PCe0tG5igiSLaHnj8NYPZMmZw9lpKdY5D5wHGTv5E
	cRZNiVgmwUxqcgwowQnecVuCPrnB/Hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-4ewOGvLgM_6vIxMC1rn_Iw-1; Sat, 16 Nov 2019 10:53:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C2D01883521;
	Sat, 16 Nov 2019 15:53:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83CC16084E;
	Sat, 16 Nov 2019 15:53:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8DD91809567;
	Sat, 16 Nov 2019 15:53:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAGFrPnZ013809 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 16 Nov 2019 10:53:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 451CE2166B2A; Sat, 16 Nov 2019 15:53:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40FD42166B27
	for <cluster-devel@redhat.com>; Sat, 16 Nov 2019 15:53:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A5E7101A55E
	for <cluster-devel@redhat.com>; Sat, 16 Nov 2019 15:53:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-425-_SEodX07NC6L8CkcXwD9WA-1;
	Sat, 16 Nov 2019 10:53:20 -0500
Received: from sasha-vm.mshome.net (unknown [50.234.116.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 48729218BA;
	Sat, 16 Nov 2019 15:53:19 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sat, 16 Nov 2019 10:50:50 -0500
Message-Id: <20191116155103.10971-87-sashal@kernel.org>
In-Reply-To: <20191116155103.10971-1-sashal@kernel.org>
References: <20191116155103.10971-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-MC-Unique: _SEodX07NC6L8CkcXwD9WA-1
X-MC-Unique: 4ewOGvLgM_6vIxMC1rn_Iw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAGFrPnZ013809
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com,
	Tycho Andersen <tycho@tycho.ws>
Subject: [Cluster-devel] [PATCH AUTOSEL 4.9 87/99] dlm: fix invalid free
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Tycho Andersen <tycho@tycho.ws>

[ Upstream commit d968b4e240cfe39d39d80483bac8bca8716fd93c ]

dlm_config_nodes() does not allocate nodes on failure, so we should not
free() nodes when it fails.

Signed-off-by: Tycho Andersen <tycho@tycho.ws>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/member.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 9c47f1c14a8ba..a47ae99f7bcbc 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -683,7 +683,7 @@ int dlm_ls_start(struct dlm_ls *ls)
=20
 =09error =3D dlm_config_nodes(ls->ls_name, &nodes, &count);
 =09if (error < 0)
-=09=09goto fail;
+=09=09goto fail_rv;
=20
 =09spin_lock(&ls->ls_recover_lock);
=20
@@ -715,8 +715,9 @@ int dlm_ls_start(struct dlm_ls *ls)
 =09return 0;
=20
  fail:
-=09kfree(rv);
 =09kfree(nodes);
+ fail_rv:
+=09kfree(rv);
 =09return error;
 }
=20
--=20
2.20.1


