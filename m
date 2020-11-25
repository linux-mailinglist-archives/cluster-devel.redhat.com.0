Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B6FD32C5180
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Nov 2020 10:44:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-CKKW-vjEOu-xPpR6bPvqJw-1; Thu, 26 Nov 2020 04:44:50 -0500
X-MC-Unique: CKKW-vjEOu-xPpR6bPvqJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FCE91E7EC;
	Thu, 26 Nov 2020 09:44:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58E941346D;
	Thu, 26 Nov 2020 09:44:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84B65180954D;
	Thu, 26 Nov 2020 09:44:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0APMilG2014996 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 17:44:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 50BE12166B29; Wed, 25 Nov 2020 22:44:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B4A22166B27
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 22:44:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 029AE811E84
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 22:44:45 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-285-lVWjNjy7MC62aP3wYEQU6w-1; Wed, 25 Nov 2020 17:44:40 -0500
X-MC-Unique: lVWjNjy7MC62aP3wYEQU6w-1
Received: by mail-wm1-f67.google.com with SMTP id w24so256771wmi.0;
	Wed, 25 Nov 2020 14:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mMrMdknFbsC77SFRvwwD3pm1cwl3V2MP65kzVJE6tY4=;
	b=SgqEni9iE22y9axrMOWmtr8BLfVwwx26poeHJy8KZdXd/UY995GW7SYA5FS59sUn+P
	tBFzNzBYBfDvUdPjN5Qduh5XQO4vNO4n1r32y8v9928LgXXv2iyZBbIn8OBu4S8DIv7C
	6oOScyxfpAbdRlcMIaSg4nJFiFoGJsw/8+hzG+FPR4nnI++USxvnktFSfBI6Jlwuuoh1
	G7xXrw/0EWdPtHHEKk0U52vZi+QnORoBMg+ZqOP7guW6Quj48FT1xipMNl5EFZ3Ahird
	G2rmrcduT+HFUj54/a+VTDJ0jVAGIuFfy5SHY3oHvRCKpfevucGr0vjmJCbOWaSt/vX/
	3NcA==
X-Gm-Message-State: AOAM5334NdLzbaSPQCx4Yv9RdE9LrAzbIE+BrMW8sVon7ibMuSyAcpcV
	SocpaJ6sIad35wnt+zviRtg=
X-Google-Smtp-Source: ABdhPJzVXPr1uOlB1vaw2cfl6zSoOiLq1F6oo5r6Yg/UanqxqpZONWe00UKvdrBaRFZ4o0pgYT/ByA==
X-Received: by 2002:a7b:cf0a:: with SMTP id l10mr6364382wmg.103.1606344279394; 
	Wed, 25 Nov 2020 14:44:39 -0800 (PST)
Received: from [192.168.1.122]
	(cpc92720-cmbg20-2-0-cust364.5-4.cable.virginm.net. [82.21.83.109])
	by smtp.gmail.com with ESMTPSA id
	h15sm6411655wrw.15.2020.11.25.14.44.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 25 Nov 2020 14:44:38 -0800 (PST)
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
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
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <44005bde-f6d4-5eaa-39b8-1a5efeedb2d3@gmail.com>
Date: Wed, 25 Nov 2020 22:44:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CANiq72kqO=bYMJnFS2uYRpgWATJ=uXxZuNUsTXT+3aLtrpnzvQ@mail.gmail.com>
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
X-Mailman-Approved-At: Thu, 26 Nov 2020 04:44:38 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 25/11/2020 00:32, Miguel Ojeda wrote:
> I have said *authoring* lines of *this* kind takes a minute per line.
> Specifically: lines fixing the fallthrough warning mechanically and
> repeatedly where the compiler tells you to, and doing so full-time for
> a month.
<snip>
> It is useful since it makes intent clear.
To make the intent clear, you have to first be certain that you
 understand the intent; otherwise by adding either a break or a
 fallthrough to suppress the warning you are just destroying the
 information that "the intent of this code is unknown".
Figuring out the intent of a piece of unfamiliar code takes more
 than 1 minute; just because
    case foo:
        thing;
    case bar:
        break;
 produces identical code to
    case foo:
        thing;
        break;
    case bar:
        break;
 doesn't mean that *either* is correct — maybe the author meant
 to write
    case foo:
        return thing;
    case bar:
        break;
 and by inserting that break you've destroyed the marker that
 would direct someone who knew what the code was about to look
 at that point in the code and spot the problem.
Thus, you *always* have to look at more than just the immediate
 mechanical context of the code, to make a proper judgement that
 yes, this was the intent.  If you think that that sort of thing
 can be done in an *average* time of one minute, then I hope you
 stay away from code I'm responsible for!
One minute would be an optimistic target for code that, as the
 maintainer, one is already somewhat familiar with.  For code
 that you're seeing for the first time, as is usually the case
 with the people doing these mechanical fix-a-warning patches,
 it's completely unrealistic.

A warning is only useful because it makes you *think* about the
 code.  If you suppress the warning without doing that thinking,
 then you made the warning useless; and if the warning made you
 think about code that didn't *need* it, then the warning was
 useless from the start.

So make your mind up: does Clang's stricter -Wimplicit-fallthrough
 flag up code that needs thought (in which case the fixes take
 effort both to author and to review) or does it flag up code
 that can be mindlessly "fixed" (in which case the warning is
 worthless)?  Proponents in this thread seem to be trying to
 have it both ways.

-ed

