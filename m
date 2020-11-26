Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A53C12C5782
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Nov 2020 15:54:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-1-ekrZFLMYqyilM0TO8Cng-1; Thu, 26 Nov 2020 09:53:59 -0500
X-MC-Unique: 1-ekrZFLMYqyilM0TO8Cng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B42158735D3;
	Thu, 26 Nov 2020 14:53:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B69F05C266;
	Thu, 26 Nov 2020 14:53:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C64811809C9F;
	Thu, 26 Nov 2020 14:53:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQErj3X015194 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Nov 2020 09:53:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CAF02CF627; Thu, 26 Nov 2020 14:53:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C50F2D0164
	for <cluster-devel@redhat.com>; Thu, 26 Nov 2020 14:53:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6190E858287
	for <cluster-devel@redhat.com>; Thu, 26 Nov 2020 14:53:42 +0000 (UTC)
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-434-cTHkjuIpP7qUf3oSu6E9oA-1; Thu, 26 Nov 2020 09:53:39 -0500
X-MC-Unique: cTHkjuIpP7qUf3oSu6E9oA-1
Received: by mail-yb1-f195.google.com with SMTP id e81so1878670ybc.1;
	Thu, 26 Nov 2020 06:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DTotsfb8u+PB0eT0g4gTrA/vgT4HfiDZTYQ/geteWC4=;
	b=e6z9mNPwo48lwT7kIV8Td7Jjkmt2EN3k299hWAQR02KqKeH3PNJpbJnkZL0Er3UFiG
	bNwnWDlCNFXVpVf/Zh73dXK16SsF/4AvPj9wbRIeCaI+rZ1tWbiwkzV4nOH1u60EZM0J
	4YenvZIAMBthQeE/Dacy+lgiNYt4weslqJoSS2+lgFxOcO+MO8TqFzCdrOWb6Kr64rcZ
	G85/BErpfG/kh0eAUdbENhgW6WseU/7vgWF/9/0P1gQhivOcOoitOjWnAM4DUyj7avty
	zYsbcaPuBkBpVnWQ7nm7bZ785if8ozAiOOScd2WMddYHTw4Sw9GT7xrZ37bZQ3zn9u6W
	zESQ==
X-Gm-Message-State: AOAM532r1z8gdqNMg1SN0RbF5zZueEuhVBu/WN9Kag/GL23G6kSA/tAg
	A56SXd3xk7P3VOlbkSsMJhXJEdJycXkNGT+UdGU=
X-Google-Smtp-Source: ABdhPJxnOXTYq+iR4KCiqWmvI5brXjGTtWFP5n3J8AJAa70YoLiXvitjZtrbfPlByRts+Q0mJZBucXgMnTrbOCoAA44=
X-Received: by 2002:a25:aac5:: with SMTP id t63mr5128050ybi.22.1606402419264; 
	Thu, 26 Nov 2020 06:53:39 -0800 (PST)
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
In-Reply-To: <44005bde-f6d4-5eaa-39b8-1a5efeedb2d3@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Nov 2020 15:53:27 +0100
Message-ID: <CANiq72nobq=ptWK-qWxU91JHqkKhMcRtJNnw2XJd5-vSJWZd8Q@mail.gmail.com>
To: Edward Cree <ecree.xilinx@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AQErj3X015194
X-loop: cluster-devel@redhat.com
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org, nouveau@lists.freedesktop.org,
	linux-iio@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
	linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
	samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-watchdog@vger.kernel.org, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	Nick Desaulniers <ndesaulniers@google.com>, linux-scsi@vger.kernel.org,
	Nathan Chancellor <natechancellor@gmail.com>,
	linux-rdma@vger.kernel.org, oss-drivers@netronome.com,
	bridge@lists.linux-foundation.org, linux-security-module@vger.kernel.org,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-input <linux-input@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	intel-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
	linux-can@vger.kernel.org, linux-block@vger.kernel.org,
	linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-mediatek@lists.infradead.org,
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
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-sctp@vger.kernel.org, linux-usb@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, Nov 25, 2020 at 11:44 PM Edward Cree <ecree.xilinx@gmail.com> wrote:
>
> To make the intent clear, you have to first be certain that you
>  understand the intent; otherwise by adding either a break or a
>  fallthrough to suppress the warning you are just destroying the
>  information that "the intent of this code is unknown".

If you don't know what the intent of your own code is, then you
*already* have a problem in your hands.

> Figuring out the intent of a piece of unfamiliar code takes more
>  than 1 minute; just because
>     case foo:
>         thing;
>     case bar:
>         break;
>  produces identical code to
>     case foo:
>         thing;
>         break;
>     case bar:
>         break;
>  doesn't mean that *either* is correct — maybe the author meant

What takes 1 minute is adding it *mechanically* by the author, i.e. so
that you later compare whether codegen is the same.

>  to write
>     case foo:
>         return thing;
>     case bar:
>         break;
>  and by inserting that break you've destroyed the marker that
>  would direct someone who knew what the code was about to look
>  at that point in the code and spot the problem.

Then it means you already have a bug. This patchset gives the
maintainer a chance to notice it, which is a good thing. The "you've
destroyed the market" claim is bogus, because:
  1. you were not looking into it
  2. you didn't notice the bug so far
  3. is implicit -- harder to spot
  4. is only useful if you explicitly take a look at this kind of bug.
So why don't you do it now?

> Thus, you *always* have to look at more than just the immediate
>  mechanical context of the code, to make a proper judgement that
>  yes, this was the intent.

I find that is the responsibility of the maintainers and reviewers for
tree-wide patches like this, assuming they want. They can also keep
the behavior (and the bugs) without spending time. Their choice.

> If you think that that sort of thing
>  can be done in an *average* time of one minute, then I hope you
>  stay away from code I'm responsible for!

Please don't accuse others of recklessness or incompetence, especially
if you didn't understand what they said.

> A warning is only useful because it makes you *think* about the
>  code.  If you suppress the warning without doing that thinking,
>  then you made the warning useless; and if the warning made you
>  think about code that didn't *need* it, then the warning was
>  useless from the start.

We are not suppressing the warning. Quite the opposite, in fact.

> So make your mind up: does Clang's stricter -Wimplicit-fallthrough
>  flag up code that needs thought (in which case the fixes take
>  effort both to author and to review)

As I said several times already, it does take time to review if the
maintainer wants to take the chance to see if they had a bug to begin
with, but it does not require thought for the author if they just go
for equivalent codegen.

> or does it flag up code
>  that can be mindlessly "fixed" (in which case the warning is
>  worthless)?  Proponents in this thread seem to be trying to
>  have it both ways.

A warning is not worthless just because you can mindlessly fix it.
There are many counterexamples, e.g. many
checkpatch/lint/lang-format/indentation warnings, functional ones like
the `if (a = b)` warning...

Cheers,
Miguel


