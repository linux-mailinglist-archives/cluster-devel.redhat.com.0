Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EA63A16242A
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 11:04:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582020296;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C2o90FN+lYrxm2KJJmFH4raJjnf6GoUSpnkFMK+Qcro=;
	b=XZoJa+4VgRZkvXF0wGmVgHGn21mJm9W4Qql504w1H8KHqGdI8bJOBkzgnK2agWLNb9ESK1
	tvgFmklPfQK6UzsW8ZeBpBpfyD1NRQRQgZZU5y9evimsLYcVHZX3LcBZJZKhCGejZy7iv3
	OKdK7uKzMWfNxvemGvUndSilt0sPj68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-5ExPb1yVMnuuGNhnt67Leg-1; Tue, 18 Feb 2020 05:04:54 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B78778010F0;
	Tue, 18 Feb 2020 10:04:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 052D810027BE;
	Tue, 18 Feb 2020 10:04:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 68E3218089C8;
	Tue, 18 Feb 2020 10:04:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IA4fIK009119 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 05:04:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 914C72166B29; Tue, 18 Feb 2020 10:04:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CACC2166B28
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 10:04:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD38218AE956
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 10:04:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-32-6-buOih7NJOeAT2b9OR-kw-1; Tue, 18 Feb 2020 05:04:34 -0500
Received: from ip-109-41-129-189.web.vodafone.de ([109.41.129.189]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3zjq-0002gZ-Vj; Tue, 18 Feb 2020 10:04:23 +0000
Date: Tue, 18 Feb 2020 11:04:06 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218110406.098fdc09@kernel.org>
In-Reply-To: <20200218040146.GM7778@bombadil.infradead.org>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
	<20200218040146.GM7778@bombadil.infradead.org>
MIME-Version: 1.0
X-MC-Unique: 6-buOih7NJOeAT2b9OR-kw-1
X-MC-Unique: 5ExPb1yVMnuuGNhnt67Leg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Martin Brandenburg <martin@omnibond.com>, Jan Kara <jack@suse.cz>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>,
	David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
	linux-mtd@lists.infradead.org, Ilya Dryomov <idryomov@gmail.com>,
	linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
	Naohiro Aota <naohiro.aota@wdc.com>, cluster-devel@redhat.com,
	linux-nilfs@vger.kernel.org, Sage Weil <sage@redhat.com>,
	Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
	Christoph, Tyler Hicks <code@tyhicks.com>,
	v9fs-developer@lists.sourceforge.net,
	Gao Xiang <xiang@kernel.org>, Jonathan,
	Salah Triki <salah.triki@gmail.com>,
	Alexey Dobriyan <adobriyan@gmail.com>, devel@lists.orangefs.org,
	Nicolas, Chao Yu <chao@kernel.org>,
	Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, Johannes, Andreas,
	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
	David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Damien Le Moal <damien.lemoal@wdc.com>, linux-ext4@vger.kernel.org,
	Luis de Bethencourt <luisbg@kernel.org>,
	Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
	Jeff Layton <jlayton@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
	ocfs2-devel@oss.oracle.com, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
	Thumshirn <jth@kernel.org>, linux-erofs@lists.ozlabs.org,
	linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 00/44] Manually convert filesystem FS
	documents to ReST
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 17 Feb 2020 20:01:46 -0800
Matthew Wilcox <willy@infradead.org> escreveu:

> On Mon, Feb 17, 2020 at 05:11:46PM +0100, Mauro Carvalho Chehab wrote:
> > There are lots of plain text documents under Documentation/filesystems.
> > 
> > Manually convert several of those to ReST and add them to the index file.  
> 
> I think at least 90% of this material needs to be in admin-guide.  Should
> we create Documentation/admin-guide/filesystems/ and move most of these
> files there?

It makes sense to me. Yet, there are some of those files that contains
both user-facing and kernel-facing docs at the same place. 

Btw, I found the same pattern on *several* other subsystems: when
someone is documenting some feature, it tends to document both kAPI,
uAPI and admin.

Right now, what we did so far on most places were to keep the stuff 
together, as splitting them could sometimes be painful.

As we are too close to finish the ReST conversion[1], I would prefer to
first finish it. 

Then, do a second pass at files outside the new directories (like
admin-guide), in order to better organize things, eventually splitting
some files into kAPI, uAPI and/or admin-guide.

[1] Looking at next-20200217, after my last doc patches applied on this tree:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=all_docs_merged

excluding (most) false positives, we have now only ~50 text files left to
convert:

$ dirname $(find Documentation/ -type f|grep -vE '\.(rst|svg|dot|py|awk|sh|pl|gitignore|S|yaml|c|inf|vim|modes)'|grep -vE '(Makefile|Kconfig|LICENSE|COPYING-logo|ChangeLog|CREDITS)'|grep -v devicetree/bindings|grep -vE 'Documentation/(ABI|features|output|SubmittingPatches|CodingStyle|logo.gif|dontdiff|sphinx/requirements.txt|admin-guide/kdump/gdbmacros.txt|admin-guide/aoe/udev.txt|EDID/hex|netlabel/draft-ietf-cipso-ipsecurity-01.txt|firmware_class/hotplug-script|target/target-export-device|networking/mac80211-auth-assoc-deauth.txt|sparc/oradax/dax-hv-api.txt)'|grep -v translations)|sort|uniq -c|sort -n
$ echo -n "Total: "
$ dirname $(find Documentation/ -type f|grep -vE '\.(rst|svg|dot|py|awk|sh|pl|gitignore|S|yaml|c|inf|vim|modes)'|grep -vE '(Makefile|Kconfig|LICENSE|COPYING-logo|ChangeLog|CREDITS)'|grep -v devicetree/bindings|grep -vE 'Documentation/(ABI|features|output|SubmittingPatches|CodingStyle|logo.gif|dontdiff|sphinx/requirements.txt|admin-guide/kdump/gdbmacros.txt|admin-guide/aoe/udev.txt|EDID/hex|netlabel/draft-ietf-cipso-ipsecurity-01.txt|firmware_class/hotplug-script|target/target-export-device|networking/mac80211-auth-assoc-deauth.txt|sparc/oradax/dax-hv-api.txt)'|grep -v translations)|wc -l

      1 Documentation/filesystems/cifs
      1 Documentation/filesystems/configfs
      1 Documentation/scsi
      1 Documentation/virt/kvm/devices
      2 Documentation/admin-guide
      3 Documentation
      6 Documentation/devicetree
      6 Documentation/filesystems/caching
      8 Documentation/RCU
     21 Documentation/filesystems
Total: 50

Once we get this series merged, I'm planning to prepare and submit a second
series doing the conversion for the other ~20 filesystem files.

Btw, if you want to look how things will become after my patch series,
I'm keeping a html build after all my patch series at:

	https://www.infradead.org/~mchehab/kernel_docs/

Cheers,
Mauro

