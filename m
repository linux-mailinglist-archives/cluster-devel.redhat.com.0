Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3673B2C25B7
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Nov 2020 13:31:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-0_411w8KNNqhIuugGUTF3A-1; Tue, 24 Nov 2020 07:31:26 -0500
X-MC-Unique: 0_411w8KNNqhIuugGUTF3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01E4E8049D6;
	Tue, 24 Nov 2020 12:31:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E25CC5D71B;
	Tue, 24 Nov 2020 12:31:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81EAB50031;
	Tue, 24 Nov 2020 12:31:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AO1l0ni026582 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 20:47:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 58EEB2166B2C; Tue, 24 Nov 2020 01:47:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5485B2166B2B
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 01:46:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06C258007D9
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 01:46:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-567-svopod3xNXeB2KrBpKJYhA-1;
	Mon, 23 Nov 2020 20:46:55 -0500
X-MC-Unique: svopod3xNXeB2KrBpKJYhA-1
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
	[163.114.132.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D0FEE206FA;
	Tue, 24 Nov 2020 01:46:49 +0000 (UTC)
Date: Mon, 23 Nov 2020 17:46:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <20201123174648.6a22575b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <CAKwvOdntVfXj2WRR5n6Kw7BfG7FdKpTeHeh5nPu5AzwVMhOHTg@mail.gmail.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<CAKwvOdntVfXj2WRR5n6Kw7BfG7FdKpTeHeh5nPu5AzwVMhOHTg@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AO1l0ni026582
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 24 Nov 2020 07:31:17 -0500
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
	X86.ARCHITECTURE" <x86@kernel.org>, 
	xen-devel@lists.xenproject.org, linux-hardening@vger.kernel.org, Nathan
	Chancellor <natechancellor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Joe
	Perches <joe@perches.com>"@redhat.c,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	dm-devel@redhat.com, keyrings@vger.kernel.org,
	GR-everest-linux-l2@marvell.com, linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, bridge@lists.linux-foundation.org,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	Kees Cook <keescook@chromium.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	intel-gfx@lists.freedesktop.org, linux-can@vger.kernel.org,
	linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
	ceph-devel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	GR-Linux-NIC-Dev@marvell.com, open list:HARDWARE RANDOM NUMBER GENERATOR
	CORE"         <linux-crypto@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, linux-ext4@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-geode@lists.infradead.org,
	linux-gpio@vger.kernel.org, li,
	el.org, samba-technical@lists.samba.org, selinux@vger.kernel.org,
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
	usb-storage@lists.one-eyed-alien.net,
	virtualization@lists.linux-foundation.org, wcn36xx@lists.infradead.org, 
	, LKML <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 23 Nov 2020 17:32:51 -0800 Nick Desaulniers wrote:
> On Sun, Nov 22, 2020 at 8:17 AM Kees Cook <keescook@chromium.org> wrote:
> > On Fri, Nov 20, 2020 at 11:51:42AM -0800, Jakub Kicinski wrote:  
> > > If none of the 140 patches here fix a real bug, and there is no change
> > > to machine code then it sounds to me like a W=2 kind of a warning.  
> >
> > FWIW, this series has found at least one bug so far:
> > https://lore.kernel.org/lkml/CAFCwf11izHF=g1mGry1fE5kvFFFrxzhPSM6qKAO8gxSp=Kr_CQ@mail.gmail.com/  
> 
> So looks like the bulk of these are:
> switch (x) {
>   case 0:
>     ++x;
>   default:
>     break;
> }
> 
> I have a patch that fixes those up for clang:
> https://reviews.llvm.org/D91895

😍


