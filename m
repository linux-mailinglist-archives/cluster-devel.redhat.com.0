Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8FF146DA3
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:58:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795117;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o45jAke5kqwhbz/xJCoTSvonApjYaGpYxb0vGWpHMiY=;
	b=MnQ7sgEYKmE7xwYYrNkhOTdRXo2CmI3FF9zBYrtdmeBF/di4eiioUwRo2q2Lmx8fZ/6vlW
	APde1F8cVaEwEHl9UCOz6sYyFmqU3Ex5ADFyCw9zo9wHzikYiauz08OsLkWQA5icFSTxfy
	WfEhDmWx/yvapXuAYs9vI/tUDpWGprg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-DzLvSPT-PgeY2DggFbvlJQ-1; Thu, 23 Jan 2020 10:58:33 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10F9BDBA3;
	Thu, 23 Jan 2020 15:58:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3D8484BBD;
	Thu, 23 Jan 2020 15:58:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A98531832DEA;
	Thu, 23 Jan 2020 15:58:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFu0Cl012307 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:56:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AD39860C81; Thu, 23 Jan 2020 15:56:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A41F60BE1
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:55:59 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:40 +0000
Message-Id: <20200123155552.1080247-2-anprice@redhat.com>
In-Reply-To: <20200123155552.1080247-1-anprice@redhat.com>
References: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 01/13] restoremeta: Use zlib by file
	descriptor
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
X-MC-Unique: DzLvSPT-PgeY2DggFbvlJQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Open the metadata file with open and pass the fd to zlib instead of the
path. This is groundwork for supporting bzip2. (gzclose() still closes
the fd later).

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 18432b7c..9de53a97 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -1197,6 +1197,7 @@ void restoremeta(const char *in_fn, const char *out_d=
evice, uint64_t printonly)
 =09gzFile gzfd;
 =09off_t pos =3D 0;
 =09struct savemeta_header smh =3D {0};
+=09int fd;
=20
 =09termlines =3D 0;
 =09if (!in_fn)
@@ -1204,7 +1205,12 @@ void restoremeta(const char *in_fn, const char *out_=
device, uint64_t printonly)
 =09if (!printonly && !out_device)
 =09=09complain("No destination file system specified.");
=20
-=09gzfd =3D gzopen(in_fn, "rb");
+=09fd =3D open(in_fn, O_RDONLY|O_CLOEXEC);
+=09if (fd < 0) {
+=09=09perror("Could not open file");
+=09=09exit(1);
+=09}
+=09gzfd =3D gzdopen(fd, "rb");
 =09if (!gzfd)
 =09=09die("Can't open source file %s: %s\n",
 =09=09    in_fn, strerror(errno));
--=20
2.24.1

