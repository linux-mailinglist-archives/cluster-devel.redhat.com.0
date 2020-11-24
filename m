Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 916082C3500
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Nov 2020 00:53:38 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-lGPiRobCPaaDo0bs6OoMuA-1; Tue, 24 Nov 2020 18:53:35 -0500
X-MC-Unique: lGPiRobCPaaDo0bs6OoMuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D30F8030CD;
	Tue, 24 Nov 2020 23:53:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4960B5C1A1;
	Tue, 24 Nov 2020 23:53:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 787574E58F;
	Tue, 24 Nov 2020 23:53:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AONrPes006566 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 18:53:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EF0D4946D5; Tue, 24 Nov 2020 23:53:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6252946D8
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 23:53:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90A34185A7BC
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 23:53:22 +0000 (UTC)
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
	[98.124.60.144]) by relay.mimecast.com with ESMTP id
	us-mta-467-VtKgrdsAO_yf7lmenakrMg-1; Tue, 24 Nov 2020 18:53:17 -0500
X-MC-Unique: VtKgrdsAO_yf7lmenakrMg-1
Received: from localhost (localhost.localdomain [127.0.0.1])
	by kvm5.telegraphics.com.au (Postfix) with ESMTP id DCBBC2AA63;
	Tue, 24 Nov 2020 18:53:13 -0500 (EST)
Date: Wed, 25 Nov 2020 10:53:13 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
In-Reply-To: <CANiq72nUt57u5DG9rH=DB0DzQH7U6-QbG-2Ou+PyCY=p=_Ggag@mail.gmail.com>
Message-ID: <alpine.LNX.2.23.453.2011251022550.14@nippy.intranet>
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
	<alpine.LNX.2.23.453.2011250859290.15@nippy.intranet>
	<CANiq72nUt57u5DG9rH=DB0DzQH7U6-QbG-2Ou+PyCY=p=_Ggag@mail.gmail.com>
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
	dri-devel@lists.freedesktop.org,
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
	ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, usb-storage@lists.one-eyed-alien.net,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-input <linux-input@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	virtualization@lists.linux-foundation.org, Linux-MM <linux-mm@kvack.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-sctp@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	linux-geode@lists.infradead.org, linux-block@vger.kernel.org,
	linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-mediatek@lists.infradead.org,
	xen-devel@lists.xenproject.org, drbd-dev@tron.linbit.com,
	linux-hams@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
	linux-can@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
	linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
	nouveau@lists.freedesktop.org,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, samba-technical@lists.samba.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
	netfilter-devel@vger.kernel.org, linux-integrity@vger.kernel.org,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII


On Wed, 25 Nov 2020, Miguel Ojeda wrote:

> 
> The C standard has nothing to do with this. We use compiler extensions 
> of several kinds, for many years. Even discounting those extensions, the 
> kernel is not even conforming to C due to e.g. strict aliasing. I am not 
> sure what you are trying to argue here.
> 

I'm saying that supporting the official language spec makes more sense 
than attempting to support a multitude of divergent interpretations of the 
spec (i.e. gcc, clang, coverity etc.)

I'm also saying that the reason why we use -std=gnu89 is that existing 
code was written in that language, not in ad hoc languages comprised of 
collections of extensions that change with every release.

> But, since you insist: yes, the `fallthrough` attribute is in the 
> current C2x draft.
> 

Thank you for checking. I found a free version that's only 6 weeks old:

http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2583.pdf

It will be interesting to see whether 6.7.11.5 changes once the various 
implementations reach agreement.

