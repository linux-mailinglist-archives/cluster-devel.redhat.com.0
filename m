Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DA8191B7CA1
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Apr 2020 19:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587749107;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cHL8Ei+o55UaAP+F71N1SHi8wyPK+QzCQeXwCjIxpWY=;
	b=UmC0UsYyb7Zkv4p/bYBt35Kh/abcn3XdYvsCkQoUYVKhFClUqcYZiPP+OuZiRrB5euWBYu
	7ZlTNHnPFnFVl1TKklyX1wXhr4MspeNHk/GCG6OHyt9Xs62kyAF3cVrW1oPI7mwaEHjzJs
	zR8JzsoiNnsmzf/LLnsm9b/WBXLQi98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-i0o6Edy6MPyQ7ZU9NLrsmw-1; Fri, 24 Apr 2020 13:25:05 -0400
X-MC-Unique: i0o6Edy6MPyQ7ZU9NLrsmw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52052800C78;
	Fri, 24 Apr 2020 17:25:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0FB7605D1;
	Fri, 24 Apr 2020 17:25:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BC5F4CA95;
	Fri, 24 Apr 2020 17:25:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OHOwqi020688 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 13:24:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 07AB29080; Fri, 24 Apr 2020 17:24:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-238.phx2.redhat.com [10.3.112.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA237605D1;
	Fri, 24 Apr 2020 17:24:57 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 24 Apr 2020 12:24:54 -0500
Message-Id: <20200424172456.616586-3-rpeterso@redhat.com>
In-Reply-To: <20200424172456.616586-1-rpeterso@redhat.com>
References: <20200424172456.616586-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 2/4] gfs2: Fix error exit in do_xmote
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

Before this patch , if an error was detected from glock function go_sync by
function do_xmote, it would return. But the function had temporarily
unlocked the gl_lockref spin_lock, and it never re-locked it.
When the caller of do_xmote tried to unlock it again, it was already
unlocked, which resulted in a corrupted spin_lock value.

This patch changes the "return" to "goto out" so the spin_lock gets
proper re-locked upon exit.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 29f9b6684b74..a1c5f245553f 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -613,7 +613,7 @@ __acquires(&gl->gl_lockref.lock)
 =09=09=09=09fs_err(sdp, "Error %d syncing glock \n", ret);
 =09=09=09=09gfs2_dump_glock(NULL, gl, true);
 =09=09=09}
-=09=09=09return;
+=09=09=09goto out;
 =09=09}
 =09}
 =09if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags)) {
--=20
2.25.1

