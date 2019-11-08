Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 77278F59FD
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Nov 2019 22:35:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573248908;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Zn768Hq84UJ5QpnPpGZBk0xJ+D1ahfNvK3yvN6t/Hwc=;
	b=W9jq8tOt9OI3/4IrHVltm4EVHeEut7blc3YDUihVPPVzseYt2ut3kDqZUTXUcDFXfAnX+h
	N2EESQj1W2D60MAMsXqSyotM4Kv3vSeGAlq5SRjkewXvvLmpv8p5CelB/ITHusk9S+yq//
	2igCF+uVL0wPamd3TQ/LJTAJnAdb/Xk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-eb1vsYWSP62K-ZaCZ25ZsQ-1; Fri, 08 Nov 2019 16:35:06 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC5EA477;
	Fri,  8 Nov 2019 21:35:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B5FF600C9;
	Fri,  8 Nov 2019 21:35:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4563F18034EA;
	Fri,  8 Nov 2019 21:35:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8LYsG7006404 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 16:34:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 65A8860FC4; Fri,  8 Nov 2019 21:34:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9306B60BE1;
	Fri,  8 Nov 2019 21:34:48 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D03683086258;
	Fri,  8 Nov 2019 21:34:46 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
	1MLzSD-1iBFNN1WBV-00Hvwr; Fri, 08 Nov 2019 22:34:36 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org, Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>
Date: Fri,  8 Nov 2019 22:32:42 +0100
Message-Id: <20191108213257.3097633-5-arnd@arndb.de>
In-Reply-To: <20191108213257.3097633-1-arnd@arndb.de>
References: <20191108213257.3097633-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:uHa/QjAGTByeAkpaDyB/vmnZ68MBZaHn8BbKmiyg4MIyd5kOgr/
	oPvkjfCzukaGEqPfPs46BihWpfl4F/gQJ3kQGEB+v25O7LUWaxKwPkPAcNHU8h+MQbnVZAN
	hd62BomG6NZ5ED6zjrQMrcCfz99gcXhaVP2VS/iuTaIzr8doR+4KM9eIgD8Ug2xmWNmrivZ
	JpWyIOQrq1vNgXmSWjp0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qd/hYklCPQw=:UXlIHNa+YNOfgmM92uODnY
	g60pWnm0PQin6NlohRtJRMf0RxVHPW8A/DGP+UHxznP/Ger+UlSBqc2mbMr0hiW0ds3eyJVPh
	OhSJFdBuRA22S+jqbdejdgkWLcJ/202e43Vy6IjyKOyOrRMy6FDKP+bM/frQA6NFGduzOfvFy
	4lQxVB6UfEWFmsIV7Y4srgYNNUlK4Qp1BuOFcA206mOMH2dKzCOfEQCtRnz7XZqSvmuBUyRxm
	72YtEOhqf+OV5PWrRo0MBLhSWamU8PWM4ZZK85PKCx8AG4RelG3GAFLXH23v/AG3gFDspXUBJ
	8WQnlWqDch6EfdHCBcykfnayrAsX0d5zpRL3hrDAIQP2WRb6g+p2wV9Ktu2yW+6RsYM1YcJiR
	eAIVUFE4MuzRm3uvYjcGnJ3/UEjBiPrQOqkbgoN8mKPbNmFddlukm3WSrUza/gUpQR7i/7dw9
	1d9x706JHtWe4fwEM8IzLGSYbkjiWuBJnxGLavzbPfXwvMYzV4x52IJxGbWVdu6DqNNNENbWw
	SUsk2UlFELckfxqSsK6Agai0whttWZ7nw60jpxXzeqJ3OiwHy+o/f3o/X5etTlxaHcnaD/1KW
	ztWcZ2okEcUFPNbVrOjKvg85SIqZq3ns/6iamtrEjhHPpCRqk2qGgsw71obLWVv2nssAtg17m
	vixTARz6rY5KMGRim7d+ffqBUmtFXeeTuNlOlLwPymIjHmeTALMTBHUMJUn9cVBNtBsziCiR9
	MPzcK0XbjKvQoazaLhrBabqX5LKRsUQs+NTs7t6b/MHfgx6NC9wMcWiPdQBPuDmKuO55EddN0
	zFxE3gb5DxTIPtjdhxPCslQ8VcNyjsEwsGIOsr/uxsNKCRaDgfWpC9xqsqg7kTWMzyADnSB0s
	UmKbhjv3Lbk+snafAvhA==
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Fri, 08 Nov 2019 21:34:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Fri, 08 Nov 2019 21:34:47 +0000 (UTC) for IP:'212.227.126.131'
	DOMAIN:'mout.kundenserver.de' HELO:'mout.kundenserver.de'
	FROM:'arnd@arndb.de' RCPT:''
X-RedHat-Spam-Score: 0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 212.227.126.131 mout.kundenserver.de
	212.227.126.131 mout.kundenserver.de <arnd@arndb.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: Willem de Bruijn <willemb@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Alexios Zavras <alexios.zavras@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	Richard Fontana <rfontana@redhat.com>,
	Deepa Dinamani <deepa.kernel@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [Cluster-devel] [PATCH 04/16] dlm: use SO_SNDTIMEO_NEW instead of
	SO_SNDTIMEO_OLD
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
X-MC-Unique: eb1vsYWSP62K-ZaCZ25ZsQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Eliminate one more use of 'struct timeval' from the kernel so
we can eventually remove the definition as well.

The kernel supports the new format with a 64-bit time_t version
of timeval here, so use that instead of the old timeval.

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

