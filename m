Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F859552
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Jun 2019 09:47:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 876E119DCB;
	Fri, 28 Jun 2019 07:47:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E61B16013A;
	Fri, 28 Jun 2019 07:47:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC23954D3D;
	Fri, 28 Jun 2019 07:47:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5S7l8RM003421 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 28 Jun 2019 03:47:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C62B92A2EA; Fri, 28 Jun 2019 07:47:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B0C217C08;
	Fri, 28 Jun 2019 07:47:05 +0000 (UTC)
Received: from mxct.zte.com.cn (out1.zte.com.cn [202.103.147.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 440715AFE3;
	Fri, 28 Jun 2019 07:47:03 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
	by Forcepoint Email with ESMTPS id C61F4C400881956A1B19;
	Fri, 28 Jun 2019 15:47:00 +0800 (CST)
Received: from kjyxapp03.zte.com.cn ([10.30.12.202])
	by mse-fl2.zte.com.cn with SMTP id x5S7ipXc044665;
	Fri, 28 Jun 2019 15:44:51 +0800 (GMT-8)
	(envelope-from yang.bin18@zte.com.cn)
Received: from mapi (kjyxapp05[null]) by mapi (Zmail) with MAPI id mid14;
	Fri, 28 Jun 2019 15:44:50 +0800 (CST)
Date: Fri, 28 Jun 2019 15:44:50 +0800 (CST)
X-Zmail-TransId: 2b075d15c572d4341672
Message-ID: <201906281544509275975@zte.com.cn>
In-Reply-To: <CAHpGcM+6p_TtHh=YSa1Mxyjr+w+V5_8RR2TgnN-s5TbbHjGhng@mail.gmail.com>
References: 1561604670-11476-1-git-send-email-yang.bin18@zte.com.cn,
	CAHpGcM+6p_TtHh=YSa1Mxyjr+w+V5_8RR2TgnN-s5TbbHjGhng@mail.gmail.com
Mime-Version: 1.0
From: <yang.bin18@zte.com.cn>
To: <andreas.gruenbacher@gmail.com>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse-fl2.zte.com.cn x5S7ipXc044665
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Fri, 28 Jun 2019 07:47:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Fri, 28 Jun 2019 07:47:04 +0000 (UTC) for IP:'202.103.147.172'
	DOMAIN:'out1.zte.com.cn' HELO:'mxct.zte.com.cn'
	FROM:'yang.bin18@zte.com.cn' RCPT:''
X-RedHat-Spam-Score: -2.299  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 202.103.147.172 out1.zte.com.cn
	202.103.147.172 out1.zte.com.cn <yang.bin18@zte.com.cn>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, wang.yi59@zte.com.cn,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel]
	=?utf-8?q?=5BPATCH=5D_sub_sd=5Frgrps_When_clear_r?= =?utf-8?q?grp?=
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 28 Jun 2019 07:47:23 +0000 (UTC)



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgQW5kcmVhcywKCj5BbSBEby4sIDI3LiBKdW5pIDIwMTkgdW0gMDU6MDggVWhyIHNjaHJpZWIg
WWFuZyBCaW4gPHlhbmcuYmluMThAenRlLmNvbS5jbj46Cj4+IEZyb206ICIgWWFuZyBCaW4gIjx5
YW5nLmJpbjE4QHp0ZS5jb20uY24+Cj4+Cj4+IFdoZW4gY2xlYXIgcmdycCxzdWIgc2RfcmdycHMg
YWZ0ZXIgZXJhc2VkIGZyb20gcmluZGV4X3RyZWUKCj50aGlzIHBhdGNoIGlzbid0IGluY29ycmVj
dCwgYnV0IGFsbCBpdCBkb2VzIGl0IGVuc3VyZSB0aGF0IHNkX3JncnBzCj5yZWFjaGVzIHplcm8g
YmVmb3JlIHdlIGRlc3Ryb3kgYSBzdHJ1Y3QgZ2ZzMl9zYmQuIEhvd2V2ZXIsIHNkX3JncnBzIGlz
Cj5vbmx5IGV2ZXIgdXNlZCB3aGVuIGEgZmlsZXN5c3RlbSBpcyBhY3RpdmUsIGFuZCB3aGlsZSB0
aGF0IGlzIHRoZQo+Y2FzZSwgaXQgY2FuIG5ldmVyIGRlY3JlYXNlLiBJdCB3aWxsIGdyb3cgd2hl
biB0aGUgZmlsZXN5c3RlbSBpcyBncm93bgo+dGhvdWdoLgoKPlNvIHdoYXQgYXJlIHlvdSB0cnlp
bmcgdG8gYWNoaWV2ZSB3aXRoIHRoaXMgcGF0Y2g/CkluIG1vdW50aW5nLCBpdCBtYXkgZmFpbCBh
bmQgdGhlbiBleGVjdXRlICJnZnMyX2NsZWFyX3JncnBkIiAuIFRvIHNvbHZlIHRoaXMgZmFpbGlu
ZyAsCkkgYWRkIHJlbG9hZCBwcm9jZXNzLHdoaWNoIHdpbGwgcmVhZCByaW5kZXggYWdhaW4gLkJ1
dCByZWxvYWQgd2lsbCAgZmFpbCAsCmJlY2F1c2Ugc2RfcmdycHMgaGFzIGJleW9uZGVkIHJpbmRl
eGBzIHNpemUuIFNvIEkgbWFrZSB0aGlzIHBhdGNoLgoKPj4gU2lnbmVkLW9mZi1ieTogWWFuZyBC
aW4gPHlhbmcuYmluMThAenRlLmNvbS5jbj4KPj4gLS0tCj4+ICBmcy9nZnMyL3JncnAuYyB8IDEg
Kwo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9m
cy9nZnMyL3JncnAuYyBiL2ZzL2dmczIvcmdycC5jCj4+IGluZGV4IDE1ZDZlMzIuLmE0YjJlODMK
Pj4gLS0tIGEvZnMvZ2ZzMi9yZ3JwLmMKPj4gKysrIGIvZnMvZ2ZzMi9yZ3JwLmMKPj4gQEAgLTcz
MCw2ICs3MzAsNyBAQCB2b2lkIGdmczJfY2xlYXJfcmdycGQoc3RydWN0IGdmczJfc2JkICpzZHAp
Cj4+ICAgICAgICAgICAgICAgICBnbCA9IHJnZC0+cmRfZ2w7Cj4+Cj4+ICAgICAgICAgICAgICAg
ICByYl9lcmFzZShuLCAmc2RwLT5zZF9yaW5kZXhfdHJlZSk7Cj4+ICsgICAgICAgICAgICAgICBz
ZHAtPnNkX3JncnBzLS07Cj4+Cj4+ICAgICAgICAgICAgICAgICBpZiAoZ2wpIHsKPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgZ2xvY2tfY2xlYXJfb2JqZWN0KGdsLCByZ2QpOwo+PiAtLQo+PiAx
LjguMy4xCj4+Cj5UaGFua3MsCj5BbmRyZWFz


--=====_003_next=====--

--=====_001_next=====--

