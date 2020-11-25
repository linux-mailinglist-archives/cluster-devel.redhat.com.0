Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 657702C3DC9
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Nov 2020 11:37:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-noCMSRbsP_mYMEofCUAEwg-1; Wed, 25 Nov 2020 05:37:47 -0500
X-MC-Unique: noCMSRbsP_mYMEofCUAEwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D57B71005E62;
	Wed, 25 Nov 2020 10:37:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D99060C43;
	Wed, 25 Nov 2020 10:37:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82ABD4BB7B;
	Wed, 25 Nov 2020 10:37:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0APAbYq9012618 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 05:37:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BE2648A4A7; Wed, 25 Nov 2020 10:37:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8719A9A0B
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 10:37:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D26010580C0
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 10:37:32 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-586-figA_XoXPUytg2bYy6CoNw-1; Wed, 25 Nov 2020 05:37:30 -0500
X-MC-Unique: figA_XoXPUytg2bYy6CoNw-1
Received: by mail-pl1-f194.google.com with SMTP id l11so918426plt.1;
	Wed, 25 Nov 2020 02:37:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lG3+Uwz8lZti6FSb8xjGyaQfdt5OwV03xvf6+L3ZqWc=;
	b=Uw2GkxENkZAN51++brXKX/i5pZAOKbFUlKAOr9pJWFPfAvWCUmsX3REr0fYzZWMhNF
	lzHeKXwuxp1yc1Bk7IGhn31tnrKzkaeapwX9ClGPRNKh98PzO5jbNZ3kL/9pstQNyBCo
	+tC9gRVfRCBgTtbDp/Y5G6jvE/81Dt0mwSBteUullj9iVRZrGNHDK77G+1LmwZ6MSo0A
	ms3xffHlWDo2HbCm1jGm8Hhp9CwNDRrdwMXZi6wyD0dMN5+1hQL/1kM/1ou2016xZ/Vw
	B8wXXQb4BnfTVyCn2SuHQXwmsFqkSby7bvRh8dFLNqKBJbOJ0oP1IGO+V1R1H8HIcCt9
	dlgw==
X-Gm-Message-State: AOAM532ubf8QGWXBX2dsgdOGCQ4bnaymWX6aMba7b3zqRvfxDjziemZn
	LiTJ6RUYcqJNla7SshLe8kBYFxZZuWSrbVJPwTM=
X-Google-Smtp-Source: ABdhPJzEY8ebPN4xZ4jf0ZFVw9i65L6qlCom+E751HZA34/qY3SkadUuuLf2HukIG4qONDPWI5feIsM1VQGLuSbFYSc=
X-Received: by 2002:a17:902:ead2:b029:da:2596:198e with SMTP id
	p18-20020a170902ead2b02900da2596198emr1937529pld.21.1606300648824;
	Wed, 25 Nov 2020 02:37:28 -0800 (PST)
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
In-Reply-To: <4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 25 Nov 2020 12:38:17 +0200
Message-ID: <CAHp75VfaewwkLsrht95Q7DaxFk7JpQjwx0KQ7Jvh5f7DUbZkRA@mail.gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
	linux-atm-general@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org, nouveau@lists.freedesktop.org,
	linux-iio <linux-iio@vger.kernel.org>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
	device-mapper development <dm-devel@redhat.com>, keyrings@vger.kernel.org,
	"open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
	GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
	samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
	usb-storage@lists.one-eyed-alien.net, linux-watchdog@vger.kernel.org,
	"open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-scsi <linux-scsi@vger.kernel.org>,
	"open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
	linux-security-module <linux-security-module@vger.kernel.org>,
	amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-input <linux-input@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
	linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
	linux-block@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org, "moderated list:ARM/Mediatek SoC support"
	<linux-mediatek@lists.infradead.org>,
	xen-devel@lists.xenproject.org, drbd-dev@tron.linbit.com,
	linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	target-devel <target-devel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
	tipc-discussion@lists.sourceforge.net, Linux-MM <linux-mm@kvack.org>,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net,
	linux-mmc <linux-mmc@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-sctp@vger.kernel.org, USB <linux-usb@vger.kernel.org>,
	netfilter-devel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
	linux-integrity <linux-integrity@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 10:39 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Mon, 2020-11-23 at 19:56 +0100, Miguel Ojeda wrote:
> > On Mon, Nov 23, 2020 at 4:58 PM James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:

...

> > But if we do the math, for an author, at even 1 minute per line
> > change and assuming nothing can be automated at all, it would take 1
> > month of work. For maintainers, a couple of trivial lines is noise
> > compared to many other patches.
>
> So you think a one line patch should take one minute to produce ... I
> really don't think that's grounded in reality.  I suppose a one line
> patch only takes a minute to merge with b4 if no-one reviews or tests
> it, but that's not really desirable.

In my practice most of the one line patches were either to fix or to
introduce quite interesting issues.
1 minute is 2-3 orders less than usually needed for such patches.
That's why I don't like churn produced by people who often even didn't
compile their useful contributions.

-- 
With Best Regards,
Andy Shevchenko

