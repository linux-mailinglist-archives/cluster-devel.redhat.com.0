Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 45EFD1A3F30
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Apr 2020 05:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586490642;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TWLQCTh4xEh9An5aGSza0r7Y2z6jmDoM7PkHXdEzWlg=;
	b=bes/ylGfRQlVMIi3oAs13HX5IptFLE41/9PIYTec/4JTvFGvVNsqJrULOlQcjJluGlyVhN
	go99O0WrwU4AmSxqOvPYqcckfAfvQ37uZPYWaYKi9GDD9bOuKm2YIItdQ1+kvZHSWproF1
	22BB9aXt33sOsTwjBtwKDRVfbBTHIpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-a-V7WavZO8Oz0C2YSmESFg-1; Thu, 09 Apr 2020 23:50:40 -0400
X-MC-Unique: a-V7WavZO8Oz0C2YSmESFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A625102C863;
	Fri, 10 Apr 2020 03:50:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9C73D766E;
	Fri, 10 Apr 2020 03:50:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6E8C93085;
	Fri, 10 Apr 2020 03:50:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03A3oYp8016997 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Apr 2020 23:50:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 22A0620230A9; Fri, 10 Apr 2020 03:50:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EA57202A940
	for <cluster-devel@redhat.com>; Fri, 10 Apr 2020 03:50:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF4B88007A4
	for <cluster-devel@redhat.com>; Fri, 10 Apr 2020 03:50:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-419-JooO9dHHM6eFBmZIpUtnIA-1;
	Thu, 09 Apr 2020 23:50:27 -0400
X-MC-Unique: JooO9dHHM6eFBmZIpUtnIA-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1ADC221655;
	Fri, 10 Apr 2020 03:50:25 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu,  9 Apr 2020 23:49:50 -0400
Message-Id: <20200410035005.9371-17-sashal@kernel.org>
In-Reply-To: <20200410035005.9371-1-sashal@kernel.org>
References: <20200410035005.9371-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03A3oYp8016997
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 4.19 17/32] gfs2: Don't demote a
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
index ccdd8c821abd7..f8a5eef3d014b 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -636,6 +636,9 @@ __acquires(&gl->gl_lockref.lock)
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


