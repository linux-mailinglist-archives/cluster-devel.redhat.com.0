Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CB35A1426D3
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jan 2020 10:13:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579511627;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FAZLgUzvwu03TFx+zt9/DcrYmZ8Owf0C+ycnAjFBSQA=;
	b=VD5DDHtE9w6YmjkcYz/LMo2tWnRkSnzUnUFEvYqUxi6Ld0yJM+PwfMLWGYDTAxd31BPb3f
	EvNYkCnn1l3l5ws7r+yzhLtH2cPiES+kfCQ2YFJ62kZKHb28b0uE6A777mV1vQdRfouRCY
	VcXw7RgUXgnf7Hy2qtJS67Of48KEyRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-D-xwddtzNL6Gcg_Eoa2_RQ-1; Mon, 20 Jan 2020 04:13:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D75118AAFB0;
	Mon, 20 Jan 2020 09:13:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 598BC10013A7;
	Mon, 20 Jan 2020 09:13:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40F4918089CE;
	Mon, 20 Jan 2020 09:13:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00K9DebT031781 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 04:13:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 982AF84D9F; Mon, 20 Jan 2020 09:13:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF61E84DAD;
	Mon, 20 Jan 2020 09:13:39 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 20 Jan 2020 10:13:04 +0100
Message-Id: <20200120091305.24997-11-agruenba@redhat.com>
In-Reply-To: <20200120091305.24997-1-agruenba@redhat.com>
References: <20200120091305.24997-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 10/11] gfs2: Wake up when setting GLF_DEMOTE
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
X-MC-Unique: D-xwddtzNL6Gcg_Eoa2_RQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wake up the sdp->sd_async_glock_wait wait queue when setting the GLF_DEMOTE
flag.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 1f906a3281b0..5c3dfec991f6 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -437,6 +437,15 @@ static void state_change(struct gfs2_glock *gl, unsign=
ed int new_state)
 =09gl->gl_tchange =3D jiffies;
 }
=20
+static void gfs2_set_demote(struct gfs2_glock *gl)
+{
+=09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
+
+=09set_bit(GLF_DEMOTE, &gl->gl_flags);
+=09smp_mb();
+=09wake_up(&sdp->sd_async_glock_wait);
+}
+
 static void gfs2_demote_wake(struct gfs2_glock *gl)
 {
 =09gl->gl_demote_state =3D LM_ST_EXCLUSIVE;
@@ -795,7 +804,7 @@ static void glock_work_func(struct work_struct *work)
=20
 =09=09if (!delay) {
 =09=09=09clear_bit(GLF_PENDING_DEMOTE, &gl->gl_flags);
-=09=09=09set_bit(GLF_DEMOTE, &gl->gl_flags);
+=09=09=09gfs2_set_demote(gl);
 =09=09}
 =09}
 =09run_queue(gl, 0);
@@ -1140,9 +1149,10 @@ int gfs2_glock_async_wait(unsigned int num_gh, struc=
t gfs2_holder *ghs)
 static void handle_callback(struct gfs2_glock *gl, unsigned int state,
 =09=09=09    unsigned long delay, bool remote)
 {
-=09int bit =3D delay ? GLF_PENDING_DEMOTE : GLF_DEMOTE;
-
-=09set_bit(bit, &gl->gl_flags);
+=09if (delay)
+=09=09set_bit(GLF_PENDING_DEMOTE, &gl->gl_flags);
+=09else
+=09=09gfs2_set_demote(gl);
 =09if (gl->gl_demote_state =3D=3D LM_ST_EXCLUSIVE) {
 =09=09gl->gl_demote_state =3D state;
 =09=09gl->gl_demote_time =3D jiffies;
--=20
2.20.1

