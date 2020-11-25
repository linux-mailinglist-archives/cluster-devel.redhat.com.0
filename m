Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D90332C49F9
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Nov 2020 22:33:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-qtpJMv9XMwyE4eXVjZg7AQ-1; Wed, 25 Nov 2020 16:33:50 -0500
X-MC-Unique: qtpJMv9XMwyE4eXVjZg7AQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3C3480401F;
	Wed, 25 Nov 2020 21:33:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26B6160C05;
	Wed, 25 Nov 2020 21:33:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99553180954D;
	Wed, 25 Nov 2020 21:33:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0APLXZtV006790 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 16:33:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1862280560; Wed, 25 Nov 2020 21:33:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 130181132B
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 21:33:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C2C2803DCE
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 21:33:32 +0000 (UTC)
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
	[98.124.60.144]) by relay.mimecast.com with ESMTP id
	us-mta-382-CJub7dimPQGuUDKrBFtJZw-1; Wed, 25 Nov 2020 16:33:30 -0500
X-MC-Unique: CJub7dimPQGuUDKrBFtJZw-1
Received: from localhost (localhost.localdomain [127.0.0.1])
	by kvm5.telegraphics.com.au (Postfix) with ESMTP id 9789F29FB0;
	Wed, 25 Nov 2020 16:33:24 -0500 (EST)
Date: Thu, 26 Nov 2020 08:33:24 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Nick Desaulniers <ndesaulniers@google.com>
In-Reply-To: <CAKwvOdkGBn7nuWTAqrORMeN1G+w3YwBfCqqaRD2nwvoAXKi=Aw@mail.gmail.com>
Message-ID: <alpine.LNX.2.23.453.2011260750300.6@nippy.intranet>
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
MIME-Version: 1.0
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
Cc: alsa-devel@alsa-project.org, bridge@lists.linux-foundation.org,
	target-devel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-mmc@vger.kernel.org, linux-fbdev@vger.kernel.org,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
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
	linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, linux-ext4@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	selinux@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	intel-gfx@lists.freedesktop.org, linux-sctp@vger.kernel.org,
	reiserfs-devel@vger.kernel.org, linux-geode@lists.infradead.org,
	linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
	xen-devel@lists.xenproject.org, drbd-dev@tron.linbit.com,
	linux-hams@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
	linux-can@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
	nouveau@lists.freedesktop.org,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, samba-technical@lists.samba.org,
	LKML <linux-kernel@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
	netfilter-devel@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-hardening@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Nov 2020, Nick Desaulniers wrote:

> So developers and distributions using Clang can't have 
> -Wimplicit-fallthrough enabled because GCC is less strict (which has 
> been shown in this thread to lead to bugs)?  We'd like to have nice 
> things too, you know.
> 

Apparently the GCC developers don't want you to have "nice things" either. 
Do you think that the kernel should drop gcc in favour of clang?
Or do you think that a codebase can somehow satisfy multiple checkers and 
their divergent interpretations of the language spec?

> This is not a shiny new warning; it's already on for GCC and has existed 
> in both compilers for multiple releases.
> 

Perhaps you're referring to the compiler feature that lead to the 
ill-fated, tree-wide /* fallthrough */ patch series.

When the ink dries on the C23 language spec and the implementations figure 
out how to interpret it then sure, enforce the warning for new code -- the 
cost/benefit analysis is straight forward. However, the case for patching 
existing mature code is another story.

