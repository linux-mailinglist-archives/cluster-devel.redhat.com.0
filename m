Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2892BC933
	for <lists+cluster-devel@lfdr.de>; Sun, 22 Nov 2020 21:36:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-oO1Yk3kLMHmcZfW365qhXQ-1; Sun, 22 Nov 2020 15:36:28 -0500
X-MC-Unique: oO1Yk3kLMHmcZfW365qhXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 625B71005D73;
	Sun, 22 Nov 2020 20:36:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CEBD1A8A1;
	Sun, 22 Nov 2020 20:36:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4AE84BB7B;
	Sun, 22 Nov 2020 20:36:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AMKaHxo008909 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 22 Nov 2020 15:36:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 11A9E2166B2B; Sun, 22 Nov 2020 20:36:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C84C2166B27
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 20:36:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3C8C800BFF
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 20:36:14 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
	[209.85.219.169]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-13-lHKe1WHKNrmmCl2O6IBrqw-1; Sun, 22 Nov 2020 15:36:10 -0500
X-MC-Unique: lHKe1WHKNrmmCl2O6IBrqw-1
Received: by mail-yb1-f169.google.com with SMTP id 2so14014121ybc.12;
	Sun, 22 Nov 2020 12:36:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GG13N+h9bYKW0tA8PzZdEh0PqD5/qSPuWfMm4/MLZZE=;
	b=rNjuO7W8nN0ny+GFecha55zIeOV8dwIaN4fr81vOHm3CRZThHb/wxrZcsCOtP3R4vd
	KWaqPNXB3I3Kz7ohopkUjHD5B8TNfP6mE1XJEXXGAusY/X6eVYPc6RsPkv1Up8eM5rrR
	RWc2QtGk5udduQvRbZ3PX/HUSJx75ek8UWjrXeo4BdJqtgoSDd7xaCCbKFymUId/GSA9
	3RLllwRBGf4CSbHH8PY7mutC7nVfPOkg8sQVDFHjFDbTLmTS/SJfPnEOAQ2BcCcwMAt8
	e13meoboPsu8MYLJJIpEXrnmU+DI4tigYa4/EkpB/F8WpgXHnsZmJGLz4Gzq7y8W5VnX
	fu0g==
X-Gm-Message-State: AOAM530SD70Q5F9NrRJ1XFT7MEmWBIyyDs6rAGFwI9tm9azH5J0ocUEe
	yKfKrza2QJwDCnARpdCe8fJPTMSts8v0LdX3i+c=
X-Google-Smtp-Source: ABdhPJzCLkP7XKvI+ogPcqXNjFlbBz0ulixnxLa8L+LTJiC1sb757UHHSouM0vJ9LX/4+Ocy8hzM6Anb9s4lPpy7cZY=
X-Received: by 2002:a25:6986:: with SMTP id e128mr4956056ybc.93.1606077369721; 
	Sun, 22 Nov 2020 12:36:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
In-Reply-To: <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Nov 2020 21:35:58 +0100
Message-ID: <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 22, 2020 at 7:22 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> Well, it's a problem in an error leg, sure, but it's not a really
> compelling reason for a 141 patch series, is it?  All that fixing this
> error will do is get the driver to print "oh dear there's a problem"
> under four more conditions than it previously did.
>
> We've been at this for three years now with nearly a thousand patches,
> firstly marking all the fall throughs with /* fall through */ and later
> changing it to fallthrough.  At some point we do have to ask if the
> effort is commensurate with the protection afforded.  Please tell me
> our reward for all this effort isn't a single missing error print.

It isn't that much effort, isn't it? Plus we need to take into account
the future mistakes that it might prevent, too. So even if there were
zero problems found so far, it is still a positive change.

I would agree if these changes were high risk, though; but they are
almost trivial.

Cheers,
Miguel

