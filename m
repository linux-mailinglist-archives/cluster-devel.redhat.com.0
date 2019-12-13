Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6A811EC14
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Dec 2019 21:51:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576270289;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZAcAG7mgipeXCKVtYDxxau4uVli01CTYaGuiOz3lA8A=;
	b=RSQU6ZxxWEgKtQTkkxFTb1C7xIzDrgeNcDLL755nIck8w4d0xmmwbTzm7clsxyr8AkYeTI
	aW5DmectXLnUjkGvIevBLQPQBlINwBol8oXBrLzieAl7pJG9zNIlwCDPXrxd4kW40j2o1q
	iGOwiJhn9EpCBAgOGWE3URzffIug/v0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-m8KYKED9O3mtvcOip4u1Gg-1; Fri, 13 Dec 2019 15:51:27 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D325A107ACC4;
	Fri, 13 Dec 2019 20:51:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C05CF5C219;
	Fri, 13 Dec 2019 20:51:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20D5B18089C8;
	Fri, 13 Dec 2019 20:51:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBDKpLOE022866 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Dec 2019 15:51:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8E70519A8B5; Fri, 13 Dec 2019 20:51:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8960F19A893
	for <cluster-devel@redhat.com>; Fri, 13 Dec 2019 20:51:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40C85185B0B1
	for <cluster-devel@redhat.com>; Fri, 13 Dec 2019 20:51:19 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-245-Jpc7HxQ8PBGuw3zK77anZw-1; Fri, 13 Dec 2019 15:51:17 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
	1MyseC-1hjtrs3ojy-00vwQi; Fri, 13 Dec 2019 21:51:15 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
	Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>
Date: Fri, 13 Dec 2019 21:49:12 +0100
Message-Id: <20191213204936.3643476-4-arnd@arndb.de>
In-Reply-To: <20191213204936.3643476-1-arnd@arndb.de>
References: <20191213204936.3643476-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:JgGd8/iX9DERj/M5iCtB2a26MaoOZ9mjFnqSnunVh+f26nRMB2x
	LJwHidIBih58zaeiqD+QWZvmjmJvr5LBgkn4Oc8KHhhUGMhjVldx6278u3WX2GeGR9jv0pY
	CNJhdcI6Y0D76LueyfFCHDEKlSN3sWitDbT8Z4iI2W7uq7ARkybx5Zp6VhwMbIjrgBJzTxZ
	WQkKtr7kPtxyMi9vGaZdg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tYDJc1dkaTc=:tLbuj+9nUfY1i2EKGWn7GZ
	asfdqauWEzm2ka5/EYjlY0E9PbE8iOKaSbLg2BFxOKsfiJQIGvd7X+Z/6Qvnf+wqY4oVBdYK8
	iTCFvER5Xc3h/QTte16lPmsHKvV6H/U3Psa1A/kdDQhwIsxA0Yf1vzGIIa0Ykyy3uqwat+spS
	IlFK1EExs+ln1uqESiCFvCQz1a73wVOpOCTFtIoPjfgfE57XOtJ9WVXHD0KSLuhMAUDb6aYJu
	GI+/JftgWouszmdndBdpapd6kQM5r4QwqMR22GQH5gdaKNQFogidIwfofy8Abc3xU0gDnK3RW
	kM5bacedZQiRpjSy8qX5U7VQGJkk8RtVIpmqB5YDmF9T148xPhkuFfYaB5nrhNM6wiunjhiQi
	9L7iAC42YiZGX8O2UbYN+TYJD6hxF561Qthbs/RG0g3u1gibbhfmsg0TH7wgzQo88kTtVIyws
	nNS9SXYeBYMZQRZkmIJrOAwY4ltzBqXZx6/meGWXhGtNTh7A3HYnJbLXa7vR5asmcJkzY+utF
	9mwmZndOfA0HZ+UnZR0P1hrTJ31aUgHKcDanBJNVWEjH9wQgUkhiqBMDNeKGWHaguGGp4vxJY
	slemB5GF87BacNA4Au6ltVXAUEcpiivAJDR1G1xCjD63y80AoES2khvMsM6u7K65nV6e4psNy
	+y70+iddiCoC39+SN3p8e8vjpa2gn6H7NDAjjT+lMolE40SVsJHsyxsxwgYid1qe7vkDQpBtF
	QOxn5+ej3Olx0Hp2eLz+P2K0ROVJYA/yYmm9RilFnS+XX31lIcQpaTCuOP2Lt5vd+RR0b61a8
	Z72PP6//0lRcQpMqV0qf4c+yhrdi3u7SNe8WGRKWjeZuOwFdfwaI8/Qapw1NfoZLLHEHjH2RY
	hb59rbY0ZGX73P63fWuQ==
X-MC-Unique: Jpc7HxQ8PBGuw3zK77anZw-1
X-MC-Unique: m8KYKED9O3mtvcOip4u1Gg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBDKpLOE022866
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Richard Fontana <rfontana@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Deepa Dinamani <deepa.kernel@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [Cluster-devel] [PATCH v2 03/24] dlm: use SO_SNDTIMEO_NEW instead
	of SO_SNDTIMEO_OLD
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
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Eliminate one more use of 'struct timeval' from the kernel so
we can eventually remove the definition as well.

The kernel supports the new format with a 64-bit time_t version
of timeval here, so use that instead of the old timeval.

Acked-by: Deepa Dinamani <deepa.kernel@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/dlm/lowcomms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 3951d39b9b75..cdfaf4f0e11a 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1035,7 +1035,7 @@ static void sctp_connect_to_sock(struct connection *c=
on)
 =09int result;
 =09int addr_len;
 =09struct socket *sock;
-=09struct timeval tv =3D { .tv_sec =3D 5, .tv_usec =3D 0 };
+=09struct __kernel_sock_timeval tv =3D { .tv_sec =3D 5, .tv_usec =3D 0 };
=20
 =09if (con->nodeid =3D=3D 0) {
 =09=09log_print("attempt to connect sock 0 foiled");
@@ -1087,12 +1087,12 @@ static void sctp_connect_to_sock(struct connection =
*con)
 =09 * since O_NONBLOCK argument in connect() function does not work here,
 =09 * then, we should restore the default value of this attribute.
 =09 */
-=09kernel_setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO_OLD, (char *)&tv,
+=09kernel_setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO_NEW, (char *)&tv,
 =09=09=09  sizeof(tv));
 =09result =3D sock->ops->connect(sock, (struct sockaddr *)&daddr, addr_len=
,
 =09=09=09=09   0);
 =09memset(&tv, 0, sizeof(tv));
-=09kernel_setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO_OLD, (char *)&tv,
+=09kernel_setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO_NEW, (char *)&tv,
 =09=09=09  sizeof(tv));
=20
 =09if (result =3D=3D -EINPROGRESS)
--=20
2.20.0


