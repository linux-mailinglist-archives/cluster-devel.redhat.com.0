Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E058D5C98F
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Jul 2019 08:49:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0BE43082140;
	Tue,  2 Jul 2019 06:49:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FBD91001925;
	Tue,  2 Jul 2019 06:49:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A5803D87;
	Tue,  2 Jul 2019 06:49:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x626nj6x026158 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jul 2019 02:49:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B3FE22C8F0; Tue,  2 Jul 2019 06:49:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.36.117.1] (ovpn-117-1.ams2.redhat.com [10.36.117.1])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 601A417996
	for <cluster-devel@redhat.com>; Tue,  2 Jul 2019 06:49:43 +0000 (UTC)
To: cluster-devel@redhat.com
References: <SG2PR01MB21414297B1293F455DFC8A5687F80@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
From: Christine Caulfield <ccaulfie@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=ccaulfie@redhat.com; prefer-encrypt=mutual; keydata=
	mQENBFTGTfkBCACagfBo5hKXqOk0o+NahnEQHgjc6JTb/h3OD/+Ht5cKi5/JvXizuLFlZX4H
	dH3ngphBukhMOjJMpH6Ve6p6cB/r4O8QqlhsVN8R2e4a4HE94VNHOaw2tT++h4CknrdkQTCe
	6BmvyuWcuuLCjlEmYxRVOZmKTYiDPgURH/4hXvghheSQTuPzwqaAGo05RaspjVpaocSYuUw/
	BiyuXXT68fuloPUwknIcnIAauWYV6Le95SyQoJXqp12gI+AeDrVvr4iFBSsoCJgmYexfM00/
	tIUO+XuOCvcfIe7cC3V9v28EN+8m0G3X3tJaR7ENRnIojoei2W92SUEiLiOyLl4IACzpABEB
	AAG0PENocmlzdGluZSBDYXVsZmllbGQgKENocmlzc2llIGF0IHdvcmspIDxjY2F1bGZpZUBy
	ZWRoYXQuY29tPokBPgQTAQIAKAUCVMZOOQIbAwUJCWYBgAYLCQgHAwIGFQgCCQoLBBYCAwEC
	HgECF4AACgkQtnFX86cNRTe3Twf+O2RXTnDt9uxSgCBMel/0Y8PdBJ8IlGinSy1h5l2S3w5e
	cJJPE5lifxszFljwIuO0MSb6IXBOEaFaDnJAOaRK93q9dVWP4NaplUafDnmvqI/o38VJY6zn
	MjvQHDoxG1vErY5+LopPNU2eu1G5UI24/wxx8OBzIcYz1wvURwPdq7jSvUcREYwyQ5V5Sms2
	/4vKF6gzu76e1xkrwzs+p/Kt9b59Fw6947qvTnKDkuB5CvtVdBxppIq57N8sJd3d83lJhu5A
	eckPcPrQ/1XiseaJk8pyGiTt6HABKwHDb5ihfWiVt8dLiBi6XHJ5AHNzEigw0c92/VmFQ5gu
	Df0QKr5P3bkBDQRUxk35AQgA816pXOMhbyR15o+PmMPiMKIAWdAiI7q+q/HSnPJfl8r+ouj/
	hX+/0qCd35tl3gv3JwObQE2og0AW3jsr7jxM6s0XQrf5OtHaxQpSRF/OVurw3zPuxQxnjRQe
	1M2zXEGHCf83D+qfHk3VXXCHL9ClzkBrwtdgXvqLBlznUAnNjgp+pETIYItRcxD65gWWTLFH
	alj5L0o3gAD4vI9KxbEbUClVXgZV4J4mMloVJxkFr5k/uqbBAT4JM1J94inpJ7+B/46LZcSM
	mn1K1LE2h5z8mXaqsgl2GsK5XodrQgC/AEqa8gjjmvqa/tBoneJrhEnLxzY8S8kUXDzgITj2
	ruM+zwARAQABiQElBBgBAgAPBQJUxk35AhsMBQkJZgGAAAoJELZxV/OnDUU3SAMH+QFE8ogD
	1gL71+rj0uuMhofR4aS1QV8oxX5Y9mtC3vCJOHT0b/soQUImqFKPKWATRYzfs98zf41QY4pJ
	HufmdQgkMTordjKavk5voWksdiI0TtTDfmWYyusOaHm6Yc5PwCahfvIvpbHY+GOkkobfnmxF
	UV9OBCnXGF9pi9H1aYWKoHMHVWCdvzLA3IXCeIfB4juco41VEMBybfBz5HtkMa1TxsaEGJuF
	wU1YQHXiMleUHT+VdWMUJmCyW4k1LBvR1oWmavnoodHvXyq+NyG9QEjeA7tUhrx6ixM6z6bb
	k0STWWQjLczIS8o7rqjE89tKWzAA8Jvl33eVRwIy7uXf5w8=
Message-ID: <3d29a330-d8ee-2960-b0fc-153173cb6195@redhat.com>
Date: Tue, 2 Jul 2019 07:49:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <SG2PR01MB21414297B1293F455DFC8A5687F80@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel]
 =?utf-8?q?Introduction_and_Advantages/Disadvantag?=
 =?utf-8?q?es_of_Clustering_in_Linux_=E2=80=93_Part_1?=
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 02 Jul 2019 06:49:51 +0000 (UTC)

On 02/07/2019 07:13, Turritopsis Dohrnii Teo En Ming wrote:
> Good afternoon from Singapore,
> 
>  
> 
> Is the following article a good reference guide?
> 
>  
> 
> Article: Introduction and Advantages/Disadvantages of Clustering in
> Linux – Part 1
> 
> Link:
> https://www.tecmint.com/what-is-clustering-and-advantages-disadvantages-of-clustering-in-linux/
> 
>  


Sadly not, as it's very out of date. The clusterlabs website is far more
current https://clusterlabs.org/quickstart.html

Chrissie

