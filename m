Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 550E82C100B
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Nov 2020 17:22:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-m0ANIpkoNcGI-PaA5pZpqg-1; Mon, 23 Nov 2020 11:22:50 -0500
X-MC-Unique: m0ANIpkoNcGI-PaA5pZpqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11DD2106F6E9;
	Mon, 23 Nov 2020 16:22:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8387F19D7C;
	Mon, 23 Nov 2020 16:22:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBD45180954D;
	Mon, 23 Nov 2020 16:22:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANGHPLd018301 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 11:17:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 878C42166B2E; Mon, 23 Nov 2020 16:17:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 802A62166B2C
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 16:17:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 076AD186E129
	for <cluster-devel@redhat.com>; Mon, 23 Nov 2020 16:17:23 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-295-_X6Rsj1iMvCexzRLrxxHpQ-1; Mon, 23 Nov 2020 11:17:12 -0500
X-MC-Unique: _X6Rsj1iMvCexzRLrxxHpQ-1
Received: by mail-io1-f68.google.com with SMTP id o11so18652573ioo.11;
	Mon, 23 Nov 2020 08:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9G9wehhbpTZzWWOvGr3rWAgWQ0geLC9Yp77M/YC6Idw=;
	b=I+9PmQmsfCHfJUpCdb58WnZ5zOC8GXRF0ZbAv1rG2kUNNluQPxBVvSTh8xsIk6adDB
	xCm0z/IgWxw3AEaaDlNUFgmk2wz3XnukyDByPJkVWEYlG04Thb6wBWKuuZlCZzPmYsSH
	iunXgaKqlkpSjal5F+TIYkp4eKBy26Nhz+5X32OGS0M0vk6Ifp0PRVSEHhu62r5VGnma
	mT4Pr1glJjg+YYXVzPxiVt+4hs4cc9e2LDUjp9cw2m7Vee0VoDI6zyRGtrkfDoGwVWXW
	ODqNOY1MNJ7WpE1vBA3MthCKvt3NVuuNbIrIq3GrYLh5Rz/LtVNMk1pTemJtsDl3OIVF
	3qZg==
X-Gm-Message-State: AOAM531ARGmQL/BaHAWf18xq17zLfSphGep8G3XY5QiNjVVbA+wt7kkT
	VEXNm0xHWj8BzIGjkViiH8SEArfKJXWfTL607nY=
X-Google-Smtp-Source: ABdhPJw5wxDBX8QpwE2CghMfFtPIAtnmG9XIUqmbpxXD9wxvuYGnavpxLlav0NBfuecvTCMrGKLgN0Lee5ktV7i8vQ8=
X-Received: by 2002:a05:6602:22c7:: with SMTP id
	e7mr415585ioe.114.1606148231969; 
	Mon, 23 Nov 2020 08:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20201121165058.1644182-1-trix@redhat.com>
	<5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
	<87y2ism5or.fsf@intel.com>
In-Reply-To: <87y2ism5or.fsf@intel.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 23 Nov 2020 17:17:00 +0100
Message-ID: <CAKXUXMydH+VtMeuftPRgCg_PYm2iChOMkUYjO=QTG=NRM3QFiw@mail.gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
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
X-Mailman-Approved-At: Mon, 23 Nov 2020 11:22:11 -0500
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
	Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	"open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
	linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
	linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	cluster-devel@redhat.com,
	clang-built-linux <clang-built-linux@googlegroups.com>,
	tboot-devel@lists.sourceforge.net, coreteam@netfilter.org,
	xen-devel@lists.xenproject.org, MPT-FusionLinux.pdl@broadcom.com,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-omap@vger.kernel.org, devel@acpica.org,
	linux-nfs@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
	linux-usb@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
	linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
	Joe Perches <joe@perches.com>, bpf@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 4:52 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Sat, 21 Nov 2020, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> > On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
> >> A difficult part of automating commits is composing the subsystem
> >> preamble in the commit log.  For the ongoing effort of a fixer
> >> producing
> >> one or two fixes a release the use of 'treewide:' does not seem
> >> appropriate.
> >>
> >> It would be better if the normal prefix was used.  Unfortunately
> >> normal is
> >> not consistent across the tree.
> >>
> >>
> >>      D: Commit subsystem prefix
> >>
> >> ex/ for FPGA DFL DRIVERS
> >>
> >>      D: fpga: dfl:
> >>
> >
> > I've got to bet this is going to cause more issues than it solves.
>
> Agreed.
>

Tom, this a problem only kernel janitors encounter; all other
developers really do not have that issue. The time spent on creating
the patch is much larger than the amount saved if the commit log
header line prefix would be derived automatically. I believe Julia
Lawall, Arnd Bergmann and Nathan Chancellor as long-term
high-frequency janitors do have already scripted approaches to that
issue. Maybe they simply need to share these scripts with you and you
consolidate them and share with everyone?

Also, making clean-up patches cumbersome has a positive side as well;
maintainers are not swamped with fully automated patch submissions.
There have been some bad experiences with some submitters on that in
the past...

> > SCSI uses scsi: <driver>: for drivers but not every driver has a
> > MAINTAINERS entry.  We use either scsi: or scsi: core: for mid layer
> > things, but we're not consistent.  Block uses blk-<something>: for all
> > of it's stuff but almost no <somtehing>s have a MAINTAINERS entry.  So
> > the next thing you're going to cause is an explosion of suggested
> > MAINTAINERs entries.
>
> On the one hand, adoption of new MAINTAINERS entries has been really
> slow. Look at B, C, or P, for instance. On the other hand, if this were
> to get adopted, you'll potentially get conflicting prefixes for patches
> touching multiple files. Then what?
>
> I'm guessing a script looking at git log could come up with better
> suggestions for prefixes via popularity contest than manually maintained
> MAINTAINERS entries. It might not always get it right, but then human
> outsiders aren't going to always get it right either.
>
> Now you'll only need Someone(tm) to write the script. ;)
>
> Something quick like this:
>
> git log --since={1year} --pretty=format:%s -- <FILES> |\
>         grep -v "^\(Merge\|Revert\)" |\
>         sed 's/:[^:]*$//' |\
>         sort | uniq -c | sort -rn | head -5
>
> already gives me results that really aren't worse than some of the
> prefixes invented by drive-by contributors.
>

I agree I do not see the need to introduce something in MAINTAINERS;
from my observations maintaining MAINTAINERS, there is sufficient work
on adoption and maintenance of the existing entries already without
such an yet another additional entry. Some entries are outdated or
wrong and the janitor task of cleaning those up is already enough work
for involved janitors and enough churn for involved maintainers. So a
machine-learned approach as above is probably good enough, but if you
think you need more complex rules try to learn them from the data at
hand... certainly a nice task to do with machine learning on commit
message prefixes.

Lukas

