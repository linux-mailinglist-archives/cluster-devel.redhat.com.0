Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E6A6A9C
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Sep 2019 15:59:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D54EB89AC0;
	Tue,  3 Sep 2019 13:59:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FD895C22C;
	Tue,  3 Sep 2019 13:59:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EBA9D1802216;
	Tue,  3 Sep 2019 13:59:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83Dxl2d008612 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 09:59:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4DC8860E1C; Tue,  3 Sep 2019 13:59:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF45F60CCE;
	Tue,  3 Sep 2019 13:59:44 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47CC230860BA;
	Tue,  3 Sep 2019 13:59:44 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n197so34144096iod.9;
	Tue, 03 Sep 2019 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Fkc3NbV4KLcHpupnkwi91JCZufWPPBN8nwlwGPYz5U0=;
	b=hlZ5Iq8IekbOZ5frDYLbC92pJuKfl/9nrnhzzKNsgZhPBMKliHoBUASq+XADHK9kZT
	quuTIb3uEvySd875fwZc7GX6M+B6uU3nERJesZUKJ9lbmo/7OuZ8PV9AEQJSYifLIzxx
	r2NWp8tI/Z7z8gWicTHXzgw/HVq5JWDpOVroutvLja8NbkD6wy1k7ImWxwVRGnFY2Ysu
	IDKA1jGJ9rhAwhFd9cLSKZwnJ6klOLPpBR6Z0LcCk+PXW5fydsUXdRgXUi+TuSmYtBlU
	vZrDgDAct7dSv5zGE/rexqgjuykBuv0RWuFgjcvuZhIizz8i6BdWLLSE7qpVB30jv6se
	mSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Fkc3NbV4KLcHpupnkwi91JCZufWPPBN8nwlwGPYz5U0=;
	b=HjQiUn9jrdFIQAUlM9LzWmHNfG+ZzBALMMuQAb5yI9mnLEK1uo9DztDV0kmHCJrGsA
	rlXqusi+bnnoP4mZ9slzvfMZvKFEZ9Z8HsXgj3DT6rM+co1CE3dIXnwBI2XozZhuQGFm
	KDXlEqtAXMcYqJbADdbWycHrVMLQgvFVJjyA+/O0b1nu8EcibFe3G2YPdhBn0UBIxJ5B
	fUWfbmuvJ46NnaCPGAbu0XaikqzqqH7KqrO9nREZyD4LP/vB5/0CrnsbDlotZcVmX2tv
	S0cikAjSOa82lt7WQEMa/jhl/ChMsXk1Cf0ElRWdRRQcWGfUwR60ywpE9X1n1xfJtGds
	V4Jw==
X-Gm-Message-State: APjAAAVRrTmurZNAbpC4HhwfgPpY7b+zLR8cczw+7YymZ3M0yw3gFrHb
	lZXlezisA6dCSF/HC/NL6sdvCwgOjFsZqdMUHN0=
X-Google-Smtp-Source: APXvYqzw7+jvpz8yv2X5/p/w9/P8Ik9jQh87gtjyc6p7KrTm/agaGZhUysFspQiZp0XruPM+yms04XOtalCSRyVTiGw=
X-Received: by 2002:a5e:9314:: with SMTP id k20mr2845608iom.245.1567519183559; 
	Tue, 03 Sep 2019 06:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <9250af4a-993c-e86e-678c-acbd59b0861a@web.de>
In-Reply-To: <9250af4a-993c-e86e-678c-acbd59b0861a@web.de>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 3 Sep 2019 15:59:32 +0200
Message-ID: <CAHpGcMKEFaZBRNnt1edrvBMS6VUXs5hMdQ2BdNBE3ssgkmDoww@mail.gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 03 Sep 2019 13:59:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 03 Sep 2019 13:59:44 +0000 (UTC) for IP:'209.85.166.66'
	DOMAIN:'mail-io1-f66.google.com' HELO:'mail-io1-f66.google.com'
	FROM:'andreas.gruenbacher@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.66 mail-io1-f66.google.com 209.85.166.66
	mail-io1-f66.google.com <andreas.gruenbacher@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Delete an unnecessary check
	before brelse()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 03 Sep 2019 13:59:53 +0000 (UTC)

Am Di., 3. Sept. 2019 um 15:21 Uhr schrieb Markus Elfring
<Markus.Elfring@web.de>:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 3 Sep 2019 15:10:05 +0200
>
> The brelse() function tests whether its argument is NULL
> and then returns immediately.
> Thus the test around the call is not needed.
>
> This issue was detected by using the Coccinelle software.

Thanks. The same applies to brelse() in gfs2_dir_no_add (which Coccinelle
apparently missed), so let me fix that as well.

Andreas

