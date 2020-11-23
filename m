Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AD1AB2C0D1D
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Nov 2020 15:20:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-b7GzAKh3PsGTTyYZ7ZqVDg-1; Mon, 23 Nov 2020 09:20:18 -0500
X-MC-Unique: b7GzAKh3PsGTTyYZ7ZqVDg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16DEB87951E;
	Mon, 23 Nov 2020 14:20:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CCA25D6D3;
	Mon, 23 Nov 2020 14:20:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 309DE5002C;
	Mon, 23 Nov 2020 14:20:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANEKB37003326 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 09:20:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 72C66110FBE3; Mon, 23 Nov 2020 14:20:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EDD3110FBE1
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 14:20:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4C551871CC5
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 14:20:08 +0000 (UTC)
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-29-8LgImwgoM6-RkhVaxFGv2w-1; Mon, 23 Nov 2020 09:20:06 -0500
X-MC-Unique: 8LgImwgoM6-RkhVaxFGv2w-1
Received: by mail-yb1-f193.google.com with SMTP id k65so16071111ybk.5;
	Mon, 23 Nov 2020 06:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WUYMqcUnfpAQa1YuH9tQ3ze5bp2bxaoGLXc9Sg/470Y=;
	b=qdva/cRzzmx5gKFNCRVe84Fsq9RsOHQmzHqrhFm3+ThudTHS0izaKy4g8blyfbIqNp
	1cG5FXz1OSdZcmplFdRGLVaMmqw6oOpNxPqno8YeDkTMfkRTxz3qogSseeQH3i8CZ5AC
	78d/7qNDxQSdbDMf2HuLlBnWSSOv6VqBocgS4P4jfR7iL5tlw9n/mXBcQ+D2xo9ZRbHy
	bV4fIBYTXv3lMqgpRFCsKWYjlQ5+Bwwc3nw4eSocvP4m83odFMPfJ/YYx7zwpAT1rS1p
	e6F8RG29Rob8HBcZNlNNISo3rlwtx2oaJO6mt9SFGeW9X74qkHfe8COQNaXsvNfTp2CP
	jsJA==
X-Gm-Message-State: AOAM533xYP2JZJkxJyADqujrX8H8HCVwduO/OxefP8wyVs+iCsTlup4v
	OeghijBATns7+TQsKQLwYxJWMsZYB5PpzX/DSPs=
X-Google-Smtp-Source: ABdhPJyiJqjBIpEzWlk5pyqpoGG3+KpoWdKnlyza2YA6ODhXnRhATytwh5Bq+iGOzNqc5gs+zuqHC8iB1cjfDTXU/ik=
X-Received: by 2002:a25:bcc7:: with SMTP id l7mr32380985ybm.115.1606141205830; 
	Mon, 23 Nov 2020 06:20:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	<CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
	<1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
In-Reply-To: <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2020 15:19:55 +0100
Message-ID: <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org, nouveau@lists.freedesktop.org,
	linux-iio@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
	samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-watchdog@vger.kernel.org, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
	linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-input <linux-input@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
	linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
	xen-devel@lists.xenproject.org, drbd-dev@tron.linbit.com,
	linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
	tipc-discussion@lists.sourceforge.net, Linux-MM <linux-mm@kvack.org>,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
	linux-integrity@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 000/141] Fix fall-through warnings for
	Clang
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 22, 2020 at 11:36 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> Well, it seems to be three years of someone's time plus the maintainer
> review time and series disruption of nearly a thousand patches.  Let's
> be conservative and assume the producer worked about 30% on the series
> and it takes about 5-10 minutes per patch to review, merge and for
> others to rework existing series.  So let's say it's cost a person year
> of a relatively junior engineer producing the patches and say 100h of
> review and application time.  The latter is likely the big ticket item
> because it's what we have in least supply in the kernel (even though
> it's 20x vs the producer time).

How are you arriving at such numbers? It is a total of ~200 trivial lines.

> It's not about the risk of the changes it's about the cost of
> implementing them.  Even if you discount the producer time (which
> someone gets to pay for, and if I were the engineering manager, I'd be
> unhappy about), the review/merge/rework time is pretty significant in
> exchange for six minor bug fixes.  Fine, when a new compiler warning
> comes along it's certainly reasonable to see if we can benefit from it
> and the fact that the compiler people think it's worthwhile is enough
> evidence to assume this initially.  But at some point you have to ask
> whether that assumption is supported by the evidence we've accumulated
> over the time we've been using it.  And if the evidence doesn't support
> it perhaps it is time to stop the experiment.

Maintainers routinely review 1-line trivial patches, not to mention
internal API changes, etc.

If some company does not want to pay for that, that's fine, but they
don't get to be maintainers and claim `Supported`.

Cheers,
Miguel

