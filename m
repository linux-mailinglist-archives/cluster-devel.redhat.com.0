Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E45F51A3F2C
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Apr 2020 05:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586490596;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GblYkNF/2rmYi+RjxffEU0kHxEsCo3oblwzhV1JJXnA=;
	b=JefqrEaVcEchK/W3mKEV1uErOGTT4CSZppyJYxeXmJvbRVDK0Hi4cdQLW0wqW7KVTix6vL
	pNxKZlckg+8XCU8H860NuiYoovWL7Mi2BA0Wm4mbgLyt1lemcyYdBYwTnkjxHqdZEH2O93
	x6/aKnTFVWWamEKY2RR1RdOgs8/D0nk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-WMkVVwXZN3KGzbpRMc8O-A-1; Thu, 09 Apr 2020 23:49:54 -0400
X-MC-Unique: WMkVVwXZN3KGzbpRMc8O-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58F2118C35A3;
	Fri, 10 Apr 2020 03:49:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4752F5C553;
	Fri, 10 Apr 2020 03:49:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30F7818089CD;
	Fri, 10 Apr 2020 03:49:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03A3no2c016939 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Apr 2020 23:49:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 428D2121850; Fri, 10 Apr 2020 03:49:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EAD4121122
	for <cluster-devel@redhat.com>; Fri, 10 Apr 2020 03:49:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E25D78FF67B
	for <cluster-devel@redhat.com>; Fri, 10 Apr 2020 03:49:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-251-dznkK1sLMHufq-aVvRyp5Q-1;
	Thu, 09 Apr 2020 23:49:43 -0400
X-MC-Unique: dznkK1sLMHufq-aVvRyp5Q-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1C498214D8;
	Fri, 10 Apr 2020 03:49:41 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu,  9 Apr 2020 23:48:50 -0400
Message-Id: <20200410034909.8922-27-sashal@kernel.org>
In-Reply-To: <20200410034909.8922-1-sashal@kernel.org>
References: <20200410034909.8922-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03A3no2c016939
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.4 27/46] gfs2: Don't demote a
	glock until its revokes are written
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit df5db5f9ee112e76b5202fbc331f990a0fc316d6 ]

Before this patch, run_queue would demote glocks based on whether
there are any more holders. But if the glock has pending revokes that
haven't been written to the media, giving up the glock might end in
file system corruption if the revokes never get written due to
io errors, node crashes and fences, etc. In that case, another node
will replay the metadata blocks associated with the glock, but
because the revoke was never written, it could replay that block
even though the glock had since been granted to another node who
might have made changes.

This patch changes the logic in run_queue so that it never demotes
a glock until its count of pending revokes reaches zero.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/glock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 0290a22ebccf5..21820a5b388fd 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -639,6 +639,9 @@ __acquires(&gl->gl_lockref.lock)
 =09=09=09goto out_unlock;
 =09=09if (nonblock)
 =09=09=09goto out_sched;
+=09=09smp_mb();
+=09=09if (atomic_read(&gl->gl_revokes) !=3D 0)
+=09=09=09goto out_sched;
 =09=09set_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags);
 =09=09GLOCK_BUG_ON(gl, gl->gl_demote_state =3D=3D LM_ST_EXCLUSIVE);
 =09=09gl->gl_target =3D gl->gl_demote_state;
--=20
2.20.1


