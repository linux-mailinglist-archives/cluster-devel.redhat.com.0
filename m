Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE392C5A11
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Nov 2020 18:06:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-EkCZITcXMIut9hWR2uP6Vw-1; Thu, 26 Nov 2020 12:06:16 -0500
X-MC-Unique: EkCZITcXMIut9hWR2uP6Vw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC344100C602;
	Thu, 26 Nov 2020 17:06:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DB891C956;
	Thu, 26 Nov 2020 17:06:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C2A85002C;
	Thu, 26 Nov 2020 17:06:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQH64vK028992 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Nov 2020 12:06:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E53A7114B301; Thu, 26 Nov 2020 17:06:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1567100BFEA
	for <cluster-devel@redhat.com>; Thu, 26 Nov 2020 17:06:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5021811E78
	for <cluster-devel@redhat.com>; Thu, 26 Nov 2020 17:06:01 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
	[209.85.219.173]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-424-Sv9OpndSOZ-JGBd-1ehvgQ-1; Thu, 26 Nov 2020 12:05:57 -0500
X-MC-Unique: Sv9OpndSOZ-JGBd-1ehvgQ-1
Received: by mail-yb1-f173.google.com with SMTP id l14so2208087ybq.3;
	Thu, 26 Nov 2020 09:05:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O/jaIJrbif54isUECHds/J8Ujq0NdoNxUTCCwJWwQ80=;
	b=ACThVGCEZystUkjzD11eNEz/7zWUcfln7G//XnSJWGvACt+bAKbVDqZeTS8HoWoirx
	QmCSdJW9/H9b/Ea0lZVKy/CXJsACQ5sXfjL4Q9XwPOk7eZL/3sM6Pu3Cm4HiSfzCCX6z
	KMkNzcvGuGGVrDHcwPfCoP7eG06yq4tGXJ4m3kfQVcF8vujh5WDpu3APnxy6u2HPNo00
	n1PU1vCcqw4HolUgs+fLX/hnHo+MaWuF4M6SIuDHZVZP9A2RIwOM9BXvk0XotP0lSd6n
	kuQ5byTau1izadsaMeTYXZMQice4NrF/IWSumN+XvAPeiKcSfeQPcA40w8HnJO8PkZFI
	qIQQ==
X-Gm-Message-State: AOAM530wz192I6FaMn8Kd8njiWL13Etag04diy6V5+lpY/eWQOv026V9
	v6bcxM0Yz2nQ97ErpdqQrVwh2YMfWRlUftLdpZ4=
X-Google-Smtp-Source: ABdhPJxMy5ncXEZ6TSWkZ0cAXTnkQ7iw+jjdg+cNNUWTZPlZcmFMrQQcJd2JAoeBontKFrtwmzLazAacI3fdsjx9xvQ=
X-Received: by 2002:a5b:40e:: with SMTP id m14mr4835621ybp.33.1606410357153;
	Thu, 26 Nov 2020 09:05:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	<CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
	<1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
	<CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
	<fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
	<CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com>
	<4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
	<CANiq72kqO=bYMJnFS2uYRpgWATJ=uXxZuNUsTXT+3aLtrpnzvQ@mail.gmail.com>
	<44005bde-f6d4-5eaa-39b8-1a5efeedb2d3@gmail.com>
	<CANiq72nobq=ptWK-qWxU91JHqkKhMcRtJNnw2XJd5-vSJWZd8Q@mail.gmail.com>
	<CAMuHMdV5kOakvZJMWLxbpigFPS+Xuw6DVYsWCWZy7wGsv3idcw@mail.gmail.com>
In-Reply-To: <CAMuHMdV5kOakvZJMWLxbpigFPS+Xuw6DVYsWCWZy7wGsv3idcw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Nov 2020 18:05:45 +0100
Message-ID: <CANiq72=n4rVvmKt0RCb5aOfQydA8bgDxfntRLDieV8Q2efP8Zg@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
	bridge@lists.linux-foundation.org,
	target-devel <target-devel@vger.kernel.org>, linux-iio@vger.kernel.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	virtualization@lists.linux-foundation.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org,
	MTD Maling List <linux-mtd@lists.infradead.org>,
	GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
	linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	driverdevel <devel@driverdev.osuosl.org>,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	scsi <linux-scsi@vger.kernel.org>,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, oss-drivers@netronome.com,
	linux-atm-general@lists.sourceforge.net,
	ceph-devel <ceph-devel@vger.kernel.org>,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, usb-storage@lists.one-eyed-alien.net,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-input <linux-input@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	linux-sctp@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	linux-geode@lists.infradead.org, linux-block@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
	xen-devel@lists.xenproject.org, Lars Ellenberg <drbd-dev@tron.linbit.com>,
	linux-hams@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
	linux-can@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>, "open list:NFS,
	SUNRPC, AND..." <linux-nfs@vger.kernel.org>, GR-Linux-NIC-Dev@marvell.com,
	Nouveau Dev <nouveau@lists.freedesktop.org>,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, samba-technical@lists.samba.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Edward Cree <ecree.xilinx@gmail.com>,
	linux-security-module <linux-security-module@vger.kernel.org>,
	USB list <linux-usb@vger.kernel.org>,
	tipc-discussion@lists.sourceforge.net,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
	NetFilter <netfilter-devel@vger.kernel.org>,
	linux-integrity <linux-integrity@vger.kernel.org>,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	linux-hardening@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 26, 2020 at 4:28 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> The maintainer is not necessarily the owner/author of the code, and
> thus may not know the intent of the code.

Agreed, I was not blaming maintainers -- just trying to point out that
the problem is there :-)

In those cases, it is still very useful: we add the `fallthrough` and
a comment saying `FIXME: fallthrough intended? Figure this out...`.
Thus a previous unknown unknown is now a known unknown. And no new
unknown unknowns will be introduced since we enabled the warning
globally.

> BTW, you cannot mindlessly fix the latter, as you cannot know if
> "(a == b)" or "((a = b))" was intended, without understanding the code
> (and the (possibly unavailable) data sheet, and the hardware, ...).

That's right, I was referring to the cases where the compiler saves
someone time from a typo they just made.

Cheers,
Miguel

