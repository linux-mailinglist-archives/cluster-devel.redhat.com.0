Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 18390E9A0D
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Oct 2019 11:35:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572431722;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vMnBP1vJh7DVtSAEiQOC37MaYouJjw4pGK3+A/kZfEE=;
	b=VlrVmrNffx9UejvqLgz7aTVR2pySCVK+lJuxHOZlPEWGWLAWjrpAeGpCUvmWbABCLdVt/i
	X8gwXsrhfs9VSX2BCLTAIRKXon0y0DtRyvqV90+iFt9jPoGKb4hytU7mubjcre5CEGnxme
	bwtJBaWj5zp5Yhuml4YaPQ/yy6ZCCV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-Rir1QYFlOz2iS0QdGQIkrA-1; Wed, 30 Oct 2019 06:35:18 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F7AF800C61;
	Wed, 30 Oct 2019 10:35:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95EBE607BF;
	Wed, 30 Oct 2019 10:35:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C2DC4BB5C;
	Wed, 30 Oct 2019 10:35:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9UAZ4rR017269 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 30 Oct 2019 06:35:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A830010016DA; Wed, 30 Oct 2019 10:35:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96A3910016EB;
	Wed, 30 Oct 2019 10:34:32 +0000 (UTC)
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
References: <157225677483.3442.4227193290486305330.stgit@buzz>
	<20191028124222.ld6u3dhhujfqcn7w@box>
	<CAHk-=wgQ-Dcs2keNJPovTb4gG33M81yANH6KZM9d5NLUb-cJ1g@mail.gmail.com>
	<20191028125702.xdfbs7rqhm3wer5t@box>
	<ac83fee6-9bcd-8c66-3596-2c0fbe6bcf96@yandex-team.ru>
	<CAHk-=who0HS=NT8U7vFDT7er_CD7+ZreRJMxjYrRXs5G6dbpyw@mail.gmail.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <f0140b13-cca2-af9e-eb4b-82eda134eb8f@redhat.com>
Date: Wed, 30 Oct 2019 10:34:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=who0HS=NT8U7vFDT7er_CD7+ZreRJMxjYrRXs5G6dbpyw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Linux-MM <linux-mm@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Cluster-devel] [PATCH] mm/filemap: do not allocate cache pages
 beyond end of file at read
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Rir1QYFlOz2iS0QdGQIkrA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

On 29/10/2019 16:52, Linus Torvalds wrote:
> On Tue, Oct 29, 2019 at 3:25 PM Konstantin Khlebnikov
> <khlebnikov@yandex-team.ru> wrote:
>> I think all network filesystems which synchronize metadata lazily should=
 be
>> marked. For example as "SB_VOLATILE". And vfs could handle them speciall=
y.
> No need. The VFS layer doesn't call generic_file_buffered_read()
> directly anyway. It's just a helper function for filesystems to use if
> they want to.
>
> They could (and should) make sure the inode size is sufficiently
> up-to-date before calling it. And if they want something more
> synchronous, they can do it themselves.
>
> But NFS, for example, has open/close consistency, so the metadata
> revalidation is at open() time, not at read time.
>
>                 Linus

NFS may be ok here, but it will break GFS2. There may be others too...=20
OCFS2 is likely one. Not sure about CIFS either. Does it really matter=20
that we might occasionally allocate a page and then free it again?

Ramfs is a simple test case, but at the same time it doesn't represent=20
the complexity of a real world filesystem. I'm just back from a few days=20
holiday so apologies if I've missed something earlier on in the discussions=
,

Steve.

