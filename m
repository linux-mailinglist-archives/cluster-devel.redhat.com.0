Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 045A22C0C98
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Nov 2020 15:10:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-7WwDCHE3OsqVwJqBDt5z_A-1; Mon, 23 Nov 2020 09:10:20 -0500
X-MC-Unique: 7WwDCHE3OsqVwJqBDt5z_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB694AFA80;
	Mon, 23 Nov 2020 14:10:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A941160C43;
	Mon, 23 Nov 2020 14:10:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6707B1809CB0;
	Mon, 23 Nov 2020 14:02:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AMMgvJc022845 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 22 Nov 2020 17:42:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ADF262166B2B; Sun, 22 Nov 2020 22:42:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A82C62166B27
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 22:42:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5938D185A794
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 22:42:55 +0000 (UTC)
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
	[98.124.60.144]) by relay.mimecast.com with ESMTP id
	us-mta-477-N8_Wu6PdOdiqQNSz_RzZNg-1; Sun, 22 Nov 2020 17:42:53 -0500
X-MC-Unique: N8_Wu6PdOdiqQNSz_RzZNg-1
Received: from localhost (localhost.localdomain [127.0.0.1])
	by kvm5.telegraphics.com.au (Postfix) with ESMTP id A588721F21;
	Sun, 22 Nov 2020 17:33:55 -0500 (EST)
Date: Mon, 23 Nov 2020 09:33:55 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Joe Perches <joe@perches.com>
In-Reply-To: <dec07021e7fc11a02b14c98b713ae2c6e2a4ca00.camel@perches.com>
Message-ID: <alpine.LNX.2.23.453.2011230810210.7@nippy.intranet>
References: <20201121165058.1644182-1-trix@redhat.com>
	<20201122032304.GE4327@casper.infradead.org>
	<ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
	<20201122145635.GG4327@casper.infradead.org>
	<0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
	<751803306cd957d0e7ef6a4fc3dbf12ebceaba92.camel@HansenPartnership.com>
	<dec07021e7fc11a02b14c98b713ae2c6e2a4ca00.camel@perches.com>
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
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Nov 2020 09:02:28 -0500
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
	Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	ibm-acpi-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Matthew Wilcox <willy@infradead.org>, linux-scsi@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
	linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	coreteam@netfilter.org, xen-devel@lists.xenproject.org,
	MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
	alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-omap@vger.kernel.org,
	devel@acpica.org, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
	linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [Cluster-devel] [RFC] MAINTAINERS tag for cleanup robot
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


On Sun, 22 Nov 2020, Joe Perches wrote:

> On Sun, 2020-11-22 at 08:49 -0800, James Bottomley wrote:
> > We can enforce sysfs_emit going forwards
> > using tools like checkpatch
> 
> It's not really possible for checkpatch to find or warn about
> sysfs uses of sprintf. checkpatch is really just a trivial
> line-by-line parser and it has no concept of code intent.
> 

Checkpatch does suffer from the limitations of regular expressions. But 
that doesn't stop people from using it. Besides, Coccinelle can do 
analyses that can't be done with regular expressions, so it's moot.

> It just can't warn on every use of the sprintf family.
> There are just too many perfectly valid uses.
> 
> > but there's no benefit and a lot of harm to
> > be done by trying to churn the entire tree
> 
> Single uses of sprintf for sysfs is not really any problem.
> 
> But likely there are still several possible overrun sprintf/snprintf
> paths in sysfs.  Some of them are very obscure and unlikely to be
> found by a robot as the logic for sysfs buf uses can be fairly twisty.
> 

Logic errors of this kind are susceptible to fuzzing, formal methods, 
symbolic execution etc. No doubt there are other techniques that I don't 
know about.

> But provably correct conversions IMO _should_ be done and IMO churn 
> considerations should generally have less importance.
> 

Provably equivalent conversions are provably churn. So apparently you're 
advocating changes that are not provably equivalent.

These are patches for code not that's not been shown to be buggy. Code 
which, after patching, can be shown to be free of a specific kind of 
theoretical bug. Hardly "provably correct".

The problem is, the class of theoretical bugs that can be avoided in this 
way is probably limitless, as is the review cost and the risk of 
accidental regressions. And the payoff is entirely theoretical.

Moreover, the patch review workload for skilled humans is being generated 
by the automation, which is completely backwards: the machine is supposed 
to be helping.

