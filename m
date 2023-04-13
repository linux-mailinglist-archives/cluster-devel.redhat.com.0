Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D48F6E151E
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Apr 2023 21:23:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681413800;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kvacU5UcCe6G1KA/9JZQyD6XX5OvhNDyA7Q1f8Khr8I=;
	b=h1ZRi41KOdd+Nq5TIvOvaAEng4u+PicCbEtFHtH+6Z4hk4nc59hBsQWO+NplTS7mfW74Uo
	5QjbdaybNyFYzMUQF9QCx/MGV/uGK7XiFBL9PI1RRZhhX199UnmQSSp5FWEqTJqgMrr+yn
	E2HfGECidpfpoxZ9p8Ck1p1sPMUg6yc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-CejJRaRZOiaoQGhq8b_tAQ-1; Thu, 13 Apr 2023 15:23:13 -0400
X-MC-Unique: CejJRaRZOiaoQGhq8b_tAQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9430E858289;
	Thu, 13 Apr 2023 19:23:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EB97492C14;
	Thu, 13 Apr 2023 19:23:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0C9D71946A6D;
	Thu, 13 Apr 2023 19:23:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2D16C19465B6 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Apr 2023 19:23:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 17E80728FB; Thu, 13 Apr 2023 19:23:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1053FBC88
 for <cluster-devel@redhat.com>; Thu, 13 Apr 2023 19:23:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4CCD88B7A7
 for <cluster-devel@redhat.com>; Thu, 13 Apr 2023 19:23:09 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-145-g1Wiy5hFM1KpD23R5_Immw-1; Thu,
 13 Apr 2023 15:23:07 -0400
X-MC-Unique: g1Wiy5hFM1KpD23R5_Immw-1
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MtPrY-1qdMXK45aY-00v6iT; Thu, 13
 Apr 2023 21:10:21 +0200
Message-ID: <5800e1f5-8681-e140-fef0-8b2c3b4b6efa@web.de>
Date: Thu, 13 Apr 2023 21:10:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, cluster-devel@redhat.com,
 Andreas Gruenbacher <agruenba@redhat.com>, Bob Peterson <rpeterso@redhat.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
X-Provags-ID: V03:K1:Zh0RTJP5q0rgxB+HvwHxCTIRPfYOBiTjaUj5vdlTUeSZZz40fte
 JNcySvqRN1Op2KyW6VLx62tCpDnb2+6Mv0VjeN3l2+yWQ/EX/7s4EFJyvfqKhD4caOMMM2o
 fpICdIdsKmcbT3g2gS5xW1g4Ccx+36DsLEudGm+4QMTEKlVoPz3ZILU8diDKalGA4RDyuvV
 cUuKP7ceyHYBorep4D77A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:K0NBNwxT49M=;0P29w5hWo5IDHZSYKaCtvjKrOX3
 sXb9TORJrfce8lGjWO/1z7kB7DzwrNoGByImCjhCMvr0PqL0/0REWkMSa5KYAt08Sbmxth0zH
 IMkg4txhKDXR4f+bKHgtjgdI0enrMtI1DNx1iGYs40qMvYugaLxeMjOVaVd4hFyyqAvxRZJHs
 96r2c+LseV8aaQxaRtn2mV7O2pgx8ngDJRDmP5rCS6+RXSmWsZYt1rUJnMeq3NkrShcdFe4dr
 WYmWP56+xAGEI7DwhlnkxifGucpfxwxtxrzrkqRFHN0n6BNzIMi2Z606fzv+gWkXld+RLI6da
 e82HkLXCILi0/pp/VQ1VPRyG1vEe5cjRQSdrIYIkISZPjSohga4oQ/1H+NIDNtbIT8PIDKLXH
 RN+OWfkFbhuZzo3eNuRXzvNpDf4esjyU3CvCKaMRFy5rqHCvrMv7m+BPCN7l+OfBda19pBbk0
 I5AtZs11iVtTHRoQokRfySHfZyZRO1lPuCmKeEQCN4hsX2DiXGIUuRRPzG6i5DfDPHvk/LPAZ
 lsaeVOQLf7cp6Wu9XkykFGLGEJe3secFuD6Fxkszo4/XgUUmSAb1k3Up2noc6IWgYoh6l/xHX
 w/Z2pM+DHSCZarL+1fzCux+LOI3Z+7mh9l9TiwL9ZrS6rd0fXyepQCwWyIMdQBjrI+wOpwm/k
 0ydB4uUYgHx6P+hPLlTpCz7xBh23P/goPT4yCy8Kd0VyvPuedfnq5ddNo/TQIgZRm2aWuFrFs
 y6svrXuaG22WxMJNmYE6p0htt9ZpkPGf2Lw8TaoOBCiA1lICif0gL54O3yg0aVN/GZT9iNU99
 NgcXixg97i85I2SzdytpFlIKBoCBctOFR43Gj3tAMwqQ5y32maNFsffBW2MuTazfhYF3vHEBi
 lMVh+t0lriWWJPysss8oAAZUYR+fBPZAGW+ujGNLuUgoWkDp6m8JnSPj+
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH] gfs2: Move a variable assignment behind a
 null pointer check in inode_go_dump()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: web.de
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Date: Thu, 13 Apr 2023 20:54:30 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cinode_go_dump=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Cinode=E2=80=9D behind the null pointer check.

This issue was detected by using the Coccinelle software.

Fixes: 27a2660f1ef944724956d92e8a312b6da0936fae ("gfs2: Dump nrpages for in=
odes and their glocks")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/gfs2/glops.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index b65950e76be5..6e33c8058059 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -535,12 +535,13 @@ static void inode_go_dump(struct seq_file *seq, struc=
t gfs2_glock *gl,
 =09=09=09  const char *fs_id_buf)
 {
 =09struct gfs2_inode *ip =3D gl->gl_object;
-=09struct inode *inode =3D &ip->i_inode;
+=09struct inode *inode;
 =09unsigned long nrpages;

 =09if (ip =3D=3D NULL)
 =09=09return;

+=09inode =3D &ip->i_inode;
 =09xa_lock_irq(&inode->i_data.i_pages);
 =09nrpages =3D inode->i_data.nrpages;
 =09xa_unlock_irq(&inode->i_data.i_pages);
--
2.40.0

