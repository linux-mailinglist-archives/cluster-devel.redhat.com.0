Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 85CB72C463B
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Nov 2020 18:04:47 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-xMAQOARmMECs-qNpICCaVQ-1; Wed, 25 Nov 2020 12:04:44 -0500
X-MC-Unique: xMAQOARmMECs-qNpICCaVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F95C9A221;
	Wed, 25 Nov 2020 17:04:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2224B19D9B;
	Wed, 25 Nov 2020 17:04:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A3F74BB7B;
	Wed, 25 Nov 2020 17:04:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0APH4ZLp010736 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 12:04:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E0D3D2166B29; Wed, 25 Nov 2020 17:04:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D907B2166B27
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 17:04:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A18E8811E84
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 17:04:32 +0000 (UTC)
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-64-oL2RPYp3NgOie0X8cIPHyA-1; Wed, 25 Nov 2020 12:04:27 -0500
X-MC-Unique: oL2RPYp3NgOie0X8cIPHyA-1
Received: by mail-yb1-f195.google.com with SMTP id v92so372838ybi.4;
	Wed, 25 Nov 2020 09:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U7yONu+GErpj3wVA3mUEvd1gZrZu1iMtuB4J5cc4iYs=;
	b=hNOqJaoBoZTZ3SSNC1BY2UR5eoV0ccZ1hLGZsvpEglwqs2cvrZZFLUVcH2xrosRdOP
	RfIR3FmcuzcaVrBiEjdIv6e+Q+snHAeuHSJR7VVga1DQWR4CrEuq1Tyg6RCfar9Lacnj
	6O7UyObOxGps93yrlcYjn6L3vZXumQb1RQF+GHFSsez1zaGKHHzkjxnj3JQHVe5V2q1l
	HbHJIzSa6NztkUSGDB7jaJCeSCICjfUJde6lZxlJpMPZJ0TOEJDwJnm6W4tt3mNKdVE8
	o7m2es8COq0UT61IC4rzX4bix1dynwWWDYy+wdwYa0t+ArpOHOJr7BDLBT0RaAx0E8Pt
	3vMg==
X-Gm-Message-State: AOAM533TkmebWqaDNFBMUu7BnJEjkAyZF6zSS6eyEAl4HzRy1ga6588e
	bh43rUsLBHSJKQBMoowyCUNMuDdohS3kk4l1xm4=
X-Google-Smtp-Source: ABdhPJwRDTWwRnnt/vVfXeVU3lUNCXdaAf9CCrzUJdkBRbFdtXrCpJBbeymEiGhAam+E5oqqQjDTbAdkVQMGwErIDPw=
X-Received: by 2002:a25:aac5:: with SMTP id t63mr6307293ybi.22.1606323866493; 
	Wed, 25 Nov 2020 09:04:26 -0800 (PST)
MIME-Version: 1.0
References: <202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	<ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
	<0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
	<d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
	<dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
	<20201123130348.GA3119@embeddedor>
	<8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
	<202011241327.BB28F12F6@keescook>
	<a841536fe65bb33f1c72ce2455a6eb47a0107565.camel@HansenPartnership.com>
	<CAKwvOdkGBn7nuWTAqrORMeN1G+w3YwBfCqqaRD2nwvoAXKi=Aw@mail.gmail.com>
	<20201125082405.1d8c23dc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201125082405.1d8c23dc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2020 18:04:15 +0100
Message-ID: <CANiq72=RuekXf1O6Fxrz2Eend0GtS6=E72P4T2=48SDqVcTChA@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: alsa-devel@alsa-project.org, bridge@lists.linux-foundation.org,
	linux-iio@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
	linux-mmc@vger.kernel.org, linux-fbdev@vger.kernel.org,
	dri-devel <dri-devel@lists.freedesktop.org>,
	LKML <linux-kernel@vger.kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
	linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, linux-watchdog@vger.kernel.org,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-scsi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-rdma@vger.kernel.org,
	oss-drivers@netronome.com, linux-atm-general@lists.sourceforge.net,
	ceph-devel@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, usb-storage@lists.one-eyed-alien.net,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-input <linux-input@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	virtualization@lists.linux-foundation.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	intel-gfx@lists.freedesktop.org, linux-sctp@vger.kernel.org,
	reiserfs-devel@vger.kernel.org, linux-geode@lists.infradead.org,
	linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-mediatek@lists.infradead.org, drbd-dev@tron.linbit.com,
	linux-hams@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
	linux-can@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
	linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
	nouveau@lists.freedesktop.org,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, samba-technical@lists.samba.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	gregkh@linuxfoundation.org, Joe Perches <joe@perches.com>,
	netfilter-devel@vger.kernel.org,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>
Subject: Re: [Cluster-devel] [Intel-wired-lan] [PATCH 000/141] Fix
	fall-through warnings for Clang
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

On Wed, Nov 25, 2020 at 5:24 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> And just to spell it out,
>
> case ENUM_VALUE1:
>         bla();
>         break;
> case ENUM_VALUE2:
>         bla();
> default:
>         break;
>
> is a fairly idiomatic way of indicating that not all values of the enum
> are expected to be handled by the switch statement.

It looks like a benign typo to me -- `ENUM_VALUE2` does not follow the
same pattern like `ENUM_VALUE1`. To me, the presence of the `default`
is what indicates (explicitly) that not everything is handled.

> Applying a real patch set and then getting a few follow ups the next day
> for trivial coding things like fallthrough missing or static missing,
> just because I didn't have the full range of compilers to check with
> before applying makes me feel pretty shitty, like I'm not doing a good
> job. YMMV.

The number of compilers, checkers, static analyzers, tests, etc. we
use keeps going up. That, indeed, means maintainers will miss more
things (unless maintainers do more work than before). But catching
bugs before they happen is *not* a bad thing.

Perhaps we could encourage more rebasing in -next (while still giving
credit to bots and testers) to avoid having many fixing commits
afterwards, but that is orthogonal.

I really don't think we should encourage the feeling that a maintainer
is doing a bad job if they don't catch everything on their reviews.
Any review is worth it. Maintainers, in the end, are just the
"guaranteed" reviewers that decide when the code looks reasonable
enough. They should definitely not feel pressured to be perfect.

Cheers,
Miguel

