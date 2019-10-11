Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F99D3D27
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Oct 2019 12:18:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BA4030833B0;
	Fri, 11 Oct 2019 10:18:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19E2A5D717;
	Fri, 11 Oct 2019 10:17:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F5F31803B48;
	Fri, 11 Oct 2019 10:17:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9BAEbcw027191 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Oct 2019 06:14:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CBF23CC8; Fri, 11 Oct 2019 10:14:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2099196B2;
	Fri, 11 Oct 2019 10:14:33 +0000 (UTC)
To: Gang He <GHe@suse.com>, "Hayes, Bill" <bill.hayes@hpe.com>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>
References: <AT5PR8401MB1025DFAE60F5A5A4BCC5D2038B940@AT5PR8401MB1025.NAMPRD84.PROD.OUTLOOK.COM>
	<CH2PR18MB3206F78AC614EAC963AF8203CF970@CH2PR18MB3206.namprd18.prod.outlook.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <8d0de038-9127-3a95-ab1d-e0ac2cc483de@redhat.com>
Date: Fri, 11 Oct 2019 11:14:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CH2PR18MB3206F78AC614EAC963AF8203CF970@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Content-Transfer-Encoding: 8bit
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9BAEbcw027191
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] Interest in DAX for OCFS2 and/or GFS2?
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 11 Oct 2019 10:18:00 +0000 (UTC)

Hi,

On 11/10/2019 08:21, Gang He wrote:
> Hello hayes,
>
>> -----Original Message-----
>> From: cluster-devel-bounces@redhat.com
>> [mailto:cluster-devel-bounces@redhat.com] On Behalf Of Hayes, Bill
>> Sent: 2019Äê10ÔÂ11ÈÕ 0:42
>> To: ocfs2-devel@oss.oracle.com; cluster-devel@redhat.com
>> Cc: Rocky (The good-looking one) Craig <rocky.craig@hpe.com>
>> Subject: [Cluster-devel] Interest in DAX for OCFS2 and/or GFS2?
>>
>> We have been experimenting with distributed file systems across multiple
>> Linux instances connected to a shared block device.  In our setup, the "disk" is
>> not a legacy SAN or iSCSI.  Instead it is a shared memory-semantic fabric
>> that is being presented as a Linux block device.
>>
>> We have been working with both GFS2 and OCFS2 to evaluate the suitability
>> to work on our shared memory configuration.  Right now we have gotten
>> both GFS2 and OCFS2 to work with block driver but each file system still does
>> block copies.  Our goal is to extend mmap() of the file system(s) to allow true
>> zero-copy load/store access directly to the memory fabric.  We believe
>> adding DAX support into the OCFS2 and/or GFS2 is an expedient path to use a
>> block device that fronts our memory fabric with DAX.
>>
>> Based on the HW that OCFS2 and GFS2 were built for (iSCSI, FC, DRDB, etc)
>> there probably has been no reason to implement DAX to date.  The advent of
>> various memory semantic fabrics (Gen-Z, NUMAlink, etc) is driving our
>> interest in extending OCFS2 and/or GFS2 to take advantage of DAX.  We
>> have two platforms set up, one based on actual hardware and another based
>> on VMs and are eager to begin deeper work.
>>
>> Has there been any discussion or interest in DAX support in OCFS2?
> No, but I think this is very interesting topic/feature.
> I hope we can take some efforts in investigating how to make OCFS2 support DAX, since some local file systems have supported this feature for long time.

Well, I think it is more accurate to say that the feature has been 
evolving in local filesystems for some time. However, it is moving 
towards time where it makes sense to think about this for clustered 
filesystems, so this is a timely topic for discussion in that sense.


>> Is there interest from the OCFS2 development community to see DAX support
>> developed and put upstream?
> >From my personal view, it is very attractive.
> But we also aware cluster file systems are usually based on DLM, DLM usually communicates with each other via the network.
> That means network latency should be considered.
>
> Thanks
> Gang

Hopefully we can come up with a design which avoids the network latency, 
at least in most cases. With GFS2 direct_io for example, the locking is 
designed such that DLM lock requests are only needed in case of block 
allocation/deallocation. Extending the same concept to DAX should allow 
(after the initial page fault) true DSM via the filesystem. It may be 
able to do even better eventually, but that would be a good starting point.

It has not been something that the GFS2 developers have looked at in any 
detail recently, however it is something that would be interesting, and 
we'd be very happy for someone to work on this and send patches in due 
course,

Steve.


>
>> Has there been any discussion or interest in DAX support in GFS2?
>> Is there interest from the GFS2 development community to see DAX support
>> developed and put upstream?
>>
>> Regards,
>> Bill
>>
>
>


