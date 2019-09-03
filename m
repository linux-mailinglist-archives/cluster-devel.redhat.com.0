Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 145ECA69C8
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Sep 2019 15:26:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 608347F766;
	Tue,  3 Sep 2019 13:26:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2950A5DA8C;
	Tue,  3 Sep 2019 13:26:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17D3D180B536;
	Tue,  3 Sep 2019 13:26:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83DKrP9007287 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 09:20:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7AA4B6062E; Tue,  3 Sep 2019 13:20:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7E18608C1;
	Tue,  3 Sep 2019 13:20:46 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56D0E3064FD3;
	Tue,  3 Sep 2019 13:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1567516843;
	bh=8p6F/11SX6cVpViLiKvZcfvZTKjngOdYepqGz4ztNyg=;
	h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
	b=p5seTyJFOtpIJJHnrG3yU7LAaVnrr1A1ePV70hLqP9B2CgAQ1dSoVE1GkqdlcLDfD
	KM9rjzoYVPfEMWUCrCU1nufOdQ+V75OlxTOxug/77k+TM730xKksfAeiC7B3XirVDi
	WfILzeL2FPXnnktNeUlgIEjfamlfx9Xrw72NquZk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.133.43]) by smtp.web.de (mrweb103
	[213.165.67.124]) with ESMTPSA (Nemesis) id 0LwHp4-1iEXRN2Tq2-017zUp;
	Tue, 03 Sep 2019 15:20:43 +0200
To: cluster-devel@redhat.com, Andreas Gruenbacher <agruenba@redhat.com>,
	Bob Peterson <rpeterso@redhat.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
	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
	FEE=
Message-ID: <9250af4a-993c-e86e-678c-acbd59b0861a@web.de>
Date: Tue, 3 Sep 2019 15:20:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:H8D1Icc6wOGUh2N+mEArqb852oKgmy9ZhFqtO+iN9G7y84+v3tN
	/9q0T12/YyxLpHP+XOrKgtO0nCZjHkf8maDBqLgIrNBsddx2m+/pV6Xjoy7K2dEkJmF92uC
	KLoLO3IMFyTqbih2Z9Y2CKMxmVzjy5aDVWv6FJu/z4AGNotOsQE1G69T4HBlwkwbmhfgNZr
	eoNeEObrAymYXJKcNyBAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QOIo4FmgA2o=:1OKt0qssUyNo2MmYUifZqK
	Xf45SbUQj8Sh6uvR64eEwDalTgOB/EQg5nnkMQLmS/5xLD1RjjviH/4H8IeAXeat+dcUz94jw
	ZJkCSCWwvewRt8CGPM75Q1Vwbx2xRKba+SvYJhyiwvAq08b/VelsCb+ghL+HbICJFcYaxFdTM
	bt84liaPZpPiwIvptQuomsTgb26WuVDnU5WpEHv3gAR2XBJF+WsvRJILMG+ohJYnNRZNn8YPd
	acqHZyQP5KbsnJRxtTWqPl3FbmzdPzbTUT4vEGcDa5Nuzl2c4/i84JUla6DTZ0N6sM0qTj7nC
	tPAB2eeVuIVSEHTOqhMkaubaJINOs4iT0SrJhP0wRVtBExlOi1UoUYu2JbmQ+i894K3t1XCdh
	XwARn1O6fwr13qNEyyDN25D5Czma2HixCJkHkrvuWfr+lrt82zxzfhv77/bF2+Zw2b5cHae77
	GGMVEzpWOJDaKl6REd3tDGHfe7LfgAzD8BzE0qhAUCX+KtSNuMeQ9tqExmSkyUnRla8gITRQx
	ZSkDjIjwCekPTA26HgVQ9rE+YrvXkc1Sx+IPQ890z3r5y0Lg8y0HOf8FK12Kq19komhhQIvot
	dIgAE/ae8iNhkeaTxCgFlO302AkQX2viBU2c8MphS1f1SeB9frhUJyP32FJedTMC6CsHdItzM
	wNyNpC5vk25QLDmAOVmf7VtQ85uMOVWyTNjum38TPiSwsC+8QEOWMn7L0Rawn+ojMeofKWzEc
	iQqwZ/lKB5N4adxwYxMkA/f/M70idG55EdGp4NsLUx442kOTnlT4Fg/uUxQ7en5EzCRbWtbzj
	KtO9somub2rJp80VVWhd0nOECsWJwngZNmDyQLhnAKD47dyaVCdAYmBDz8nfhaer+jW57h4vE
	3CkgOJAVnDHubS1MU3wsD1LA/XKqoRtO+ZpqwlRrcF6QToZyfs03yrwtTorVzEy9ar6WvYI6+
	isKr7H+yswChHb1wep7YOf834da3e0Ap4Dqv6/wCFrH3KN6HOo3fxigBKLg3YjI+iGFSCEVP6
	QncPF6bosHFGrK5uEGWZx0k/3BLyo6DOzDS81+fmoW2p9Rp/AKLI8G2e40w1O8Hzvr1M6y1PK
	NHdA0BCugvr+OLmn/dUUARrLlf9a5pl6+ACZm4KVnQofz99vngemPDxw/KochRYTR6enImZ2e
	UPmRGvn1Ob78Omg9QYCzeG0qzPE9cI/pUeZbgvlGVwM9rw6A==
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Tue, 03 Sep 2019 13:20:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Tue, 03 Sep 2019 13:20:46 +0000 (UTC) for IP:'212.227.17.12'
	DOMAIN:'mout.web.de' HELO:'mout.web.de'
	FROM:'Markus.Elfring@web.de' RCPT:''
X-RedHat-Spam-Score: -0.799  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 212.227.17.12 mout.web.de 212.227.17.12 mout.web.de
	<Markus.Elfring@web.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: 8bit
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x83DKrP9007287
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 03 Sep 2019 09:26:07 -0400
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: [Cluster-devel] [PATCH] gfs2: Delete an unnecessary check before
	brelse()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Tue, 03 Sep 2019 13:26:14 +0000 (UTC)

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Sep 2019 15:10:05 +0200

The brelse() function tests whether its argument is NULL
and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/gfs2/dir.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index 6f35d19eec25..eb9c0578978f 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -1463,8 +1463,7 @@ static int gfs2_dir_read_leaf(struct inode *inode, struct dir_context *ctx,
 				sort_offset : entries, copied);
 out_free:
 	for(i = 0; i < leaf; i++)
-		if (larr[i])
-			brelse(larr[i]);
+		brelse(larr[i]);
 	kvfree(larr);
 out:
 	return error;
--
2.23.0


